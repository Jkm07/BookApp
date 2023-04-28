import 'dart:io';
import 'package:client/authorModel/author.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'globals.dart' as globals;

class AuthorsDatabase{

  Future createLoanList () async{
    String userID = await globals.userDatabase.getUserID();
    await FirebaseFirestore.instance.collection("loans").doc(Uuid().v4()).set( { "userID": userID, "booksID": [] } );
  }

  Future<List<Author>> getAllAuthors( ) async{
    var querySnapshot = await FirebaseFirestore.instance.collection("authors").get();

    final authors = querySnapshot.docs
        .map((doc) => Author.fromJson(doc.data())).toList();

    return authors;
  }

  Future<List<Author>> getAuthorsList( List<String> authorsID ) async{
    List<Author> authors = [];

    for( int i = 0; i < authorsID.length; i++ )
    {
      var querySnapshot = await FirebaseFirestore.instance.collection("authors").where("authorID", isEqualTo: authorsID[i]).get();

      final author = querySnapshot.docs
          .map((doc) => Author.fromJson(doc.data())).toList();

      authors = authors!..addAll(author);
    }

    return authors;
  }

}