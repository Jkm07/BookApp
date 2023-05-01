import 'package:client/models/loanElement/loan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../globals.dart' as globals;

class LoansDatabase {
  // Future createLoan () async{
  //   String userID = await globals.userDatabase.getUserID();
  //   await FirebaseFirestore.instance.collection("loans").doc(Uuid().v4()).set( { "userID": userID, "products": [] } );
  // }
  //
  // Future<List<String>> getAllUserLoans() async{
  //   String userID = await globals.userDatabase.getUserID();
  //   List<String> loans;
  //   var documentSnapshot = await FirebaseFirestore.instance.collection("loansList").doc(userID).get();
  //   loans = List.from( documentSnapshot.data()!["products"] );
  //
  //   return loans;
  // }

  Future<List<LoanElement>> getAllUserLoans() async {
    String userID = await globals.userDatabase.getUserID();
    //List<LoanElement> loans = [];
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("loansList")
        .doc(userID)
        .get();

    final loanList = documentSnapshot.get("loanList");
    final loans = loanList.map<LoanElement>((element) => LoanElement.fromJson(element)).toList();

    // for (int i = 0; i < loanList.length; i++) {
    //   loans.add(LoanElement.fromJson(loanList[i]));
    // }

    print(loans);
    //await updateLoanList(loans);
    return loans;
  }

  Future createLoanRecordForUser() async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .set({"loanList": []});
  }

  Future updateLoanList(List<LoanElement> newList) async{
    String userID = await globals.userDatabase.getUserID();
    final jsonList = newList.map((e) => e.toJson()).toList();

    print("before  await");
    await globals.booksDatabase
        .getFirestore()!
    .collection("loansList")
    .doc(userID)
    .set({
      "loanList": jsonList
    });
    print("after update");
  }

  Future cleanLoanList() async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .update({"loanList": []});
  }

  Future addBookToLoanList(String bookID, String libraryID) async {
    String userID = await globals.userDatabase.getUserID();
    await globals.booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .update({
      "loanList": FieldValue.arrayUnion([bookID])
    });
  }

  Future removeBookFromLoanList(String bookID, String libraryID) async {
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