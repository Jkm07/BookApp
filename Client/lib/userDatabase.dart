import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';

class UserDatabase{

  Future<String> getUserID() async
  {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user!.uid;

    return await uid;
  }

  getMail() async
  {
    String? mailAddress;
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = await auth.currentUser;
    mailAddress = await user?.email;
    return mailAddress;
  }

}