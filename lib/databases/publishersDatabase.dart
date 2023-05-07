import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../models/publisherModel/publisher.dart';

class PublisherDatabase {
  Future<Publisher> getPublisher(String publisherID) async {
    Publisher publisher;
    var querySnapshot = await FirebaseFirestore.instance
        .collection("publishers")
        .where("publisherID", isEqualTo: publisherID)
        .get();

    publisher = querySnapshot.docs
        .map((doc) => Publisher.fromJson(doc.data()))
        .toList()[0];

    return publisher;
  }
}
