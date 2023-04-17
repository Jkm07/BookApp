import 'package:universal_io/io.dart';
import 'package:client/authorModel/author.dart';
import 'package:client/bookModel/book.dart';
import 'package:client/publisherModel/publisher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class BooksDatabase{

  static FirebaseStorage? _storage = null;
  static FirebaseAuth? _auth = null;
  static FirebaseFirestore? _firestore = null;

  FirebaseStorage? getStorage ()
  {
    if( _storage == null )
    {
      _storage = FirebaseStorage.instance;
    }

    return _storage;
  }

  FirebaseAuth? getAuth ()
  {
    if ( _auth == null )
    {
      _auth = FirebaseAuth.instance;
    }

    return _auth;
  }

  FirebaseFirestore? getFirestore ()
  {
    if ( _firestore == null )
    {

      _firestore = FirebaseFirestore.instance;
    }

    return _firestore;
  }

  Future <List<Book>> getBooksFromCategory(String categoryName, String search, String sort) async
  {
    final database = FirebaseFirestore.instance.collection("books");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;

    if( categoryName == "all" )
    {
      querySnapshot = await database.get();
    }
    else
    {
      querySnapshot = await database.where("category", isEqualTo: categoryName).get();
    }

    final books = querySnapshot!.docs
        .map((doc) => Book.fromJson(doc.data()))
        .toList();

    //searching
    //books.removeWhere((item) => !(item.title.toLowerCase() /*+ item.productCategory.toLowerCase()*/).contains(search.toLowerCase()));

    //sort
    // if( sort == "Price: ascending" )
    // {
    //   books.sort( (a, b) => a.productPrice.compareTo(b.productPrice));
    // }
    // else if ( sort == "Price: descending" )
    // {
    //   books.sort( (a, b) => b.productPrice.compareTo(a.productPrice));
    // }
    return books;
  }

  Future<List<String>> uploadImages( List<Uint8List> imageFiles, String nameBookID ) async
  {
    List<String> imageUrls = [];

    for ( int i = 0; i < imageFiles.length; i++ )
    {
      try
      {
        final ref = getStorage()!.ref().child("images").child( nameBookID + " " + DateTime.now().toString());
        var fileBytes = await imageFiles[i];
        await ref.putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));
        imageUrls.add(await ref.getDownloadURL());
      }
      catch(error)
      {
        print(error);
      }
    }

    return imageUrls;
  }

  Future<String> checkAndAddAuthor( String authorName ) async{
    String authorID = "";
    bool found = false;
    final database = getFirestore()?.collection("authors");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database!.get();

    final authors = querySnapshot.docs
        .map((doc) => Author.fromJson(doc.data()))
        .toList();

    String editedName = authorName.replaceAll(' ', '').toLowerCase();
    for( int i = 0; i < authors.length; i++ )
    {
      if( authors[i].authorName.replaceAll(' ', '').toLowerCase() == editedName )
        {
          found = true;
          authorID = authors[i].authorID;
          break;
        }
    }

    if ( !found )
    {
      authorID = Uuid().v4();
      Author newAuthor = Author.author(authorID: authorID, authorName: authorName);
      await getFirestore()!.collection("authors").doc(newAuthor.authorID).set(newAuthor.toJson());
    }

    return authorID;
  }

  Future<String> checkAndAddPublisher( String publisherName ) async{
    String publisherID = "";
    bool found = false;
    final database = getFirestore()?.collection("publishers");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database!.get();

    final publishers = querySnapshot.docs
        .map((doc) => Publisher.fromJson(doc.data()))
        .toList();

    String editedName = publisherName.replaceAll(' ', '').toLowerCase();
    for( int i = 0; i < publishers.length; i++ )
    {
      if( publishers[i].publisherName.replaceAll(' ', '').toLowerCase() == editedName )
      {
        found = true;
        publisherID = publishers[i].publisherID;
        break;
      }
    }

    if ( !found )
    {
      publisherID = Uuid().v4();
      Publisher newPublisher = Publisher.publisher(publisherID: publisherID, publisherName: publisherName);
      await getFirestore()!.collection("publishers").doc(newPublisher.publisherID).set(newPublisher.toJson());
    }

    return publisherID;
  }

  Future<void> updateBook( Book book ) async{
    await getFirestore()!.collection("books").doc(book.bookID).update(book.toJson());
  }

  Future<void> addBook( Book book) async{
    await getFirestore()!.collection("books").doc(book.bookID).set(book.toJson());
  }

  Future<void> deleteBook( Book book ) async{
    await getFirestore()!.collection("books").doc(book.bookID).delete();
  }

}