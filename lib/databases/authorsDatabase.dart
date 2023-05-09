import 'package:client/models/bookModel/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
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

  Future<List<Author>> getAuthorsByBookId(String bookID) async {
    final database = FirebaseFirestore.instance.collection("books");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("bookID", isEqualTo: bookID).get();
    final books = querySnapshot.docs.map((doc) =>
        Book.fromJson(doc.data())).toList();
    return getAuthorsList(books[0].authorsID);
  }
}
