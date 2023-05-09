import 'package:client/models/libraryModel/library.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../globals.dart';

class LibraryDatabase {
  Future<void> updateLibrary(Library library) async {
    await FirebaseFirestore.instance
        .collection("libraries")
        .doc(library.libraryID)
        .update(library.toJson());
  }

  Future<void> addLibrary(Library library) async {
    await FirebaseFirestore.instance
        .collection("libraries")
        .doc(library.libraryID)
        .set(library.toJson());
  }

  Future<void> deleteLibrary(Library library) async {
    await FirebaseFirestore.instance
        .collection("libraries")
        .doc(library.libraryID)
        .delete();
  }

  Future<List<Library>> getLibrariesWhereBookIsAvail(String bookID) async {
    List<Library> libraries = await getLibraries("", "", "All");
    List<Library> result = [];

    for (int i = 0; i < libraries.length; i++) {
      if (libraries[i].booksAndQuantity.containsKey(bookID) &&
          int.parse(libraries[i].booksAndQuantity[bookID]!) > 0) {
        result.add(libraries[i]);
      }
    }
    return result;
  }

  Future<void> updateBookQuantity(
      String librarianID, String quantity, String bookID) async {
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    querySnapshot =
        await database.where("librarianList", arrayContains: librarianID).get();
    var libraries =
        querySnapshot.docs.map((doc) => Library.fromJson(doc.data())).toList();

    if (libraries.isNotEmpty) {
      var library = libraries[0];
      Map<String, String> bookQuantity = Map.of(library.booksAndQuantity);
      if (library.booksAndQuantity.containsKey(bookID)) {
        library.booksAndQuantity[bookID] = quantity;
        Library updatedLibrary = Library.library(
            libraryID: library.libraryID,
            name: library.name,
            address: library.address,
            librarianList: library.librarianList,
            booksAndQuantity: library.booksAndQuantity);
        await updateLibrary(updatedLibrary);
      } else {
        bookQuantity.addAll({bookID: quantity});
        Library updatedLibrary = Library.library(
            libraryID: library.libraryID,
            name: library.name,
            address: library.address,
            librarianList: library.librarianList,
            booksAndQuantity: bookQuantity);
        await updateLibrary(updatedLibrary);
      }
    }
  }

  Future<void> updateBookQuantityWhenBorrowOrEnded(String libraryID, String bookID, int value) async{
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    querySnapshot = await database.where( "libraryID", isEqualTo: libraryID ).get();
    var libraries = querySnapshot.docs
        .map((doc) => Library.fromJson(doc.data()))
        .toList();

    if (libraries.isNotEmpty) {
      var library = libraries[0];
      Map<String, String> bookQuantity = Map.of(library.booksAndQuantity);
      if(bookQuantity.containsKey(bookID)){
        bookQuantity[bookID] = (int.parse(bookQuantity[bookID]!) + value).toString();
      }

      Library updatedLibrary = Library.library(
          libraryID: library.libraryID,
          name: library.name,
          address: library.address,
          librarianList: library.librarianList,
          booksAndQuantity: bookQuantity);
      await updateLibrary(updatedLibrary);
    }
  }

  Future<List<Library>> getLibraries(
      String search, String sort, String filter) async {
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    if (filter == "All") querySnapshot = await database.get();

    // if( filter == "All" ){
    //   querySnapshot =
    //   await database.where("userType", isNotEqualTo: "admin").get();
    // }else{
    //   querySnapshot =
    //   await database.where("userType", isEqualTo: filter).get();
    // }

    final libraries =
        querySnapshot!.docs.map((doc) => Library.fromJson(doc.data())).toList();

    //searching
    if (search != "")
      libraries.removeWhere(
          (item) => !(item.name.toLowerCase()).contains(search.toLowerCase()));

    //sort
    if (sort == "Name: alphabetically") {
      libraries
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    return libraries;
  }

  Future<Library> getLibrary(String libraryID) async {
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    querySnapshot =
        await database.where("libraryID", isEqualTo: libraryID).get();

    final libraries =
        querySnapshot.docs.map((doc) => Library.fromJson(doc.data())).toList();

    return libraries[0];
  }

  Future<Library?> getUserLibrary(String userID) async {
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    querySnapshot =
        await database.where("librarianList", arrayContains: userID).get();

    final libraries =
        querySnapshot.docs.map((doc) => Library.fromJson(doc.data())).toList();

    return libraries.isEmpty ? null : libraries[0];
  }

  Stream<Library> getLibraryStream(String libraryID)
  {
    final library = booksDatabase.getFirestore()!.collection("libraries").doc(libraryID);
    return library.snapshots().map((doc) => Library.fromJson(doc.data()!));
  }

  Stream<Library?> getUserLibraryStream(String userID)
  {
    final library = booksDatabase.getFirestore()!.collection("libraries").where("librarianList", arrayContains: userID).limit(1);
    return library.snapshots().map((event) => event.docs.map((e) => Library.fromJson(e.data())).toList()[0]);
  }
}
