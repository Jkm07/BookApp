import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';
import '../globals.dart';
import '../models/authorModel/author.dart';

class AuthorsDatabase {

  Future<List<Author>> getAllAuthors() async {
    var querySnapshot =
        await FirebaseFirestore.instance.collection("authors").get();

    final authors =
        querySnapshot.docs.map((doc) => Author.fromJson(doc.data())).toList();

    return authors;
  }

  Future<List<Author>> getAuthorsList(List<String> authorsID) async {
    List<Author> authors = [];

    for (int i = 0; i < authorsID.length; i++) {
      var querySnapshot = await FirebaseFirestore.instance
          .collection("authors")
          .where("authorID", isEqualTo: authorsID[i])
          .get();

      final author =
          querySnapshot.docs.map((doc) => Author.fromJson(doc.data())).toList();

      authors = authors..addAll(author);
    }

    return authors;
  }

  Future<List<String>> getAuthorsStringName(List<String> authorsID) async {
    List<String> authors = [];

    for (int i = 0; i < authorsID.length; i++) {
      var querySnapshot = await FirebaseFirestore.instance
          .collection("authors")
          .where("authorID", isEqualTo: authorsID[i])
          .get();

      final author =
      querySnapshot.docs.map((doc) => Author.fromJson(doc.data())).toList();

      authors.add(author[0].authorName);
    }

    return authors;
  }
}
