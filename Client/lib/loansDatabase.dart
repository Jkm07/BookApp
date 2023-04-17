import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'globals.dart' as globals;

class LoansDatabase{

  Future createLoan () async{
    String userID = await globals.userDatabase.getUserID();
    await FirebaseFirestore.instance.collection("loans").doc(Uuid().v4()).set( { "userID": userID, "products": [] } );
  }

  Future<List<String>> getUserLoansList() async{
    String userID = await globals.userDatabase.getUserID();
    List<String> loans;
    var documentSnapshot = await FirebaseFirestore.instance.collection("loans").doc(userID).get();
    loans = List.from( documentSnapshot.data()!["products"] );

    return loans;
  }

}