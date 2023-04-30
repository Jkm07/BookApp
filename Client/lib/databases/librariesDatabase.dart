import 'package:client/models/libraryModel/library.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../globals.dart';

class LibraryDatabase{

  Future<void> updateLibrary( Library library ) async{
    await FirebaseFirestore.instance.collection("libraries").doc(library.libraryID).update(library.toJson());
  }

  Future<void> addLibrary( Library library) async{
    await FirebaseFirestore.instance.collection("libraries").doc(library.libraryID).set(library.toJson());
  }

  Future<void> deleteLibrary( Library library ) async{
    await FirebaseFirestore.instance.collection("libraries").doc(library.libraryID).delete();
  }

  Future<void> updateQuantities( Map<String, String> map, String librarianID ) async {
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    querySnapshot = await database.where( "librarianList", arrayContains: librarianID ).get();

    final libraries = querySnapshot!.docs
        .map((doc) => Library.fromJson(doc.data()))
        .toList();

    if( libraries.isNotEmpty ){
      final library = libraries[0];
      Map<String, String> newMap = {};
      newMap.addAll(library.booksAndQuantity);
      newMap.addAll(map);

      Library updatedLibrary = Library.library(libraryID: library.libraryID, name: library.name, address: library.address, librarianList: library.librarianList, booksAndQuantity: newMap);
      await updateLibrary(updatedLibrary);
    }
  }

  Future<List<Library>> getLibraries(String search, String sort, String filter) async {
    final database = booksDatabase.getFirestore()!.collection("libraries");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    if( filter == "All" ) querySnapshot = await database.get();

    // if( filter == "All" ){
    //   querySnapshot =
    //   await database.where("userType", isNotEqualTo: "admin").get();
    // }else{
    //   querySnapshot =
    //   await database.where("userType", isEqualTo: filter).get();
    // }

    final libraries = querySnapshot!.docs
        .map((doc) => Library.fromJson(doc.data()))
        .toList();

    //searching
    if( search != "" ) libraries.removeWhere((item) => !(item.name.toLowerCase()).contains(search.toLowerCase()));

    //sort
    if( sort == "Name: alphabetically" )
    {
      libraries.sort( (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }

    return libraries;
  }

}