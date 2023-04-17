import 'dart:io';
import 'package:client/authorModel/author.dart';
import 'package:client/publisherModel/publisher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'globals.dart' as globals;

class PublisherDatabase{

  Future<Publisher> getPublisher( String publisherID ) async{
    Publisher publisher;
    var querySnapshot = await FirebaseFirestore.instance.collection("publishers").where("publisherID", isEqualTo: publisherID).get();

    publisher = querySnapshot.docs
        .map((doc) => Publisher.fromJson(doc.data())).toList()[0];

    return publisher;
  }

}