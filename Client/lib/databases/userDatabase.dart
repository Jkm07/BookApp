import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../globals.dart';
import '../models/libraryModel/library.dart';
import '../models/userModel/userLibrary.dart';

class UserDatabase {
  Future<String> getUserID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return uid;
  }

  Future changeUsername(String newUsername) async{
    var currentUser = FirebaseAuth.instance.currentUser;
    final database = booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("userID", isEqualTo: currentUser?.uid).get();
    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data())).toList();

    if(users.isNotEmpty){
      final user = users[0];
      final updatedUser = UserLibrary.user(userID: user.userID, userName: newUsername, userMail: user.userMail, userType: user.userType);
      await updateUser(updatedUser);
    }
  }

  Future changeEmail(String newEmail) async{
    var user = FirebaseAuth.instance.currentUser;
    await user?.updateEmail(newEmail);
  }

  Future changePassword(String newPassword) async{
    var user = FirebaseAuth.instance.currentUser;
    await user?.updatePassword(newPassword);
  }

  getMail() async {
    String? mailAddress;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    mailAddress = user?.email;
    return mailAddress;
  }

  addUser(UserLibrary user) async {
    await booksDatabase
        .getFirestore()!
        .collection("users")
        .doc(user.userID)
        .set(user.toJson());
  }

  updateUser(UserLibrary user) async {
    await booksDatabase
        .getFirestore()!
        .collection("users")
        .doc(user.userID)
        .update(user.toJson());
  }

  deleteUserData(UserLibrary user) async {
    await booksDatabase
        .getFirestore()!
        .collection("users")
        .doc(user.userID)
        .delete();
  }

  refreshUser(String userID) async{
    final database = booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("userID", isEqualTo: userID).get();
    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    return users[0];
  }

  deleteMyAccount() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    currentUser!.delete();
  }

  Future<UserLibrary> getCurrentUser() async {
    String userID = await getUserID();
    final database = booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("userID", isEqualTo: userID).get();

    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    return users[0];
  }

  changePermissions(String email, String accountType) async {
    final database =booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("userMail", isEqualTo: email).get();

    final user = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    if (user.isNotEmpty) {
      UserLibrary updatedUser = UserLibrary.user(
          userID: user[0].userID,
          userName: user[0].userName,
          userMail: user[0].userMail,
          userType: accountType);
      await booksDatabase
          .getFirestore()!
          .collection("users")
          .doc(updatedUser.userID)
          .update(updatedUser.toJson());
    }
  }

  Future<List<UserLibrary>> getLibraryLibrarians(List<String> librariansID ) async{
    final database = booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    querySnapshot = await database.where("userType", isEqualTo: "librarian").get();

    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    List<UserLibrary> result = [];

    for(int i = 0; i < users.length; i++){
      if(librariansID.contains(users[i].userID)){
        result.add(users[i]);
      }
    }

    return result;
  }

  Future<List<UserLibrary>> getUsers(String search, String sort, String userType) async {
    final database = booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    if( userType == "All" ){
      querySnapshot =
      await database.where("userType", isNotEqualTo: "admin").get();
    }else{
      querySnapshot =
      await database.where("userType", isEqualTo: userType).get();
    }

    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    //searching
    if( search != "" ) users.removeWhere((item) => !(item.userName.toLowerCase()).contains(search.toLowerCase()));

    //sort
    if( sort == "Username: alphabetically" )
    {
      users.sort( (a, b) => a.userName.toLowerCase().compareTo(b.userName.toLowerCase()));
    }

    return users;
  }

  Future<List<UserLibrary>> getLibrarians(String search, String sort, String userType, Library? library) async {
    final database = booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    if( userType == "All" ){
      querySnapshot =
      await database.where("userType", isNotEqualTo: "admin").get();
    }else{
      querySnapshot =
      await database.where("userType", isEqualTo: userType).get();
    }

    List<UserLibrary> result = [];

    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    List<Library> libraries = await libraryDatabase.getLibraries("", "", "All");
    //get free librarians
    for(int i = 0; i < users.length; i++){
      bool free = true;
      for(int j = 0; j < libraries.length; j++){
        if( libraries[j].librarianList.contains(users[i].userID) ){
          free = false;
          break;
        }
      }

      if(free){
        result.add(users[i]);
      }
    }

    //add current librarians
    if( library != null ) {
      final lib = await libraryDatabase.getLibrary(library.libraryID);
      result = new List.from(result)..addAll(await getLibraryLibrarians( lib.librarianList ));
    }

    //searching
    if( search != "" ) users.removeWhere((item) => !(item.userName.toLowerCase()).contains(search.toLowerCase()));

    //sort
    if( sort == "Username: alphabetically" )
    {
      users.sort( (a, b) => a.userName.toLowerCase().compareTo(b.userName.toLowerCase()));
    }
    result = result.toSet().toList();

    return result;
  }
}