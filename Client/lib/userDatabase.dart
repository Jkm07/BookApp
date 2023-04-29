import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:client/userModel/userLibrary.dart';
import 'dart:async';
import 'userModel/userLibrary.dart';
import 'globals.dart' as globals;

class UserDatabase {
  Future<String> getUserID() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return uid;
  }

  getMail() async {
    String? mailAddress;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    mailAddress = user?.email;
    return mailAddress;
  }

  addUser(UserLibrary user) async {
    await globals.booksDatabase
        .getFirestore()!
        .collection("users")
        .doc(user.userID)
        .set(user.toJson());
  }

  Future<UserLibrary> getCurrentUser() async {
    String userID = await getUserID();
    final database = globals.booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("userID", isEqualTo: userID).get();

    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    return users[0];
  }

  changePermissions(String email) async {
    final database = globals.booksDatabase.getFirestore()!.collection("users");
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
          userType: "librarian");
      await globals.booksDatabase
          .getFirestore()!
          .collection("users")
          .doc(updatedUser.userID)
          .update(updatedUser.toJson());
    }
  }

  Future<List<UserLibrary>> getUsers() async {
    final database = globals.booksDatabase.getFirestore()!.collection("users");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot =
        await database.where("userType", isNotEqualTo: "admin").get();

    final users = querySnapshot.docs
        .map((doc) => UserLibrary.fromJson(doc.data()))
        .toList();

    return users;
  }
}
