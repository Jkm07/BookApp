import 'package:client/models/loanElement/loan.dart';
import 'package:client/models/loanModel/loan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../globals.dart' as globals;
import '../globals.dart';

class LoansDatabase {

  Future<List<LoanElement>> getAllUserLoans() async {
    String userID = await globals.userDatabase.getUserID();
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("loansList")
        .doc(userID)
        .get();

    final loanList = documentSnapshot.get("loanList");
    final loans = loanList.map<LoanElement>((element) => LoanElement.fromJson(element)).toList();

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

    await globals.booksDatabase
        .getFirestore()!
    .collection("loansList")
    .doc(userID)
    .set({
      "loanList": jsonList
    });
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
    List<LoanElement> loans = await getAllUserLoans();
    if(!(await checkBookOnLoanList(bookID, libraryID))){
      LoanElement newLoan = LoanElement.loan(bookID: bookID, libraryID: libraryID, quantity: "1");
      loans.add(newLoan);
      updateLoanList(loans);
    }
  }

  Future deleteBookOnLoanList(String bookID, String libraryID) async{
    List<LoanElement> loans = await getAllUserLoans();
    int? index;
    for(int i = 0; i < loans.length; i++){
      if(loans[i].bookID == bookID && loans[i].libraryID == libraryID){
        index = i;
        break;
      }
    }

    if(index != null){
      loans.removeAt(index);
    }
    updateLoanList(loans);
  }

  Future checkBookOnLoanList(String bookID, String libraryID) async{
    List<LoanElement> loans = await getAllUserLoans();
    for(int i = 0; i < loans.length; i++){
      if(loans[i].bookID == bookID && loans[i].libraryID == libraryID){
        return true;
      }
    }
    return false;
  }

}