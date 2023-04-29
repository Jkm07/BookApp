import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'globals.dart' as globals;

class LoansDatabase {
  // Future createLoan () async{
  //   String userID = await globals.userDatabase.getUserID();
  //   await FirebaseFirestore.instance.collection("loans").doc(Uuid().v4()).set( { "userID": userID, "products": [] } );
  // }
  //
  // Future<List<String>> getAllUserLoans() async{
  //   String userID = await globals.userDatabase.getUserID();
  //   List<String> loans;
  //   var documentSnapshot = await FirebaseFirestore.instance.collection("loans").doc(userID).get();
  //   loans = List.from( documentSnapshot.data()!["products"] );
  //
  //   return loans;
  // }

  Future createLoanRecordForUser() async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .set({"userID": userID, "booksID": []});
  }

  Future cleanLoanList() async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .update({"userID": userID, "booksID": []});
  }

  Future addBookToLoanList(String bookID) async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .update({
      "booksID": FieldValue.arrayUnion([bookID])
    });
  }

  Future removeBookFromLoanList(String bookID) async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .update({
      "booksID": FieldValue.arrayRemove([bookID])
    });
  }

  Future<List<String>> getLoansList() async {
    String userID = await globals.userDatabase.getUserID();
    List<String> booksID;
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("loansList")
        .doc(userID)
        .get();
    booksID = List.from(documentSnapshot.data()!["booksID"]);

    return booksID;
  }
}
