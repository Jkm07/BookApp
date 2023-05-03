import 'package:client/models/loanElement/loan.dart';
import 'package:client/models/loanModel/loan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import '../globals.dart';
import '../models/bookModel/book.dart';
import '../models/libraryModel/library.dart';

class LoansDatabase {

  //Methods for LoanHistory
  Future<Loan> getLoanByID(String loanID) async{
    final database = FirebaseFirestore.instance.collection("loans");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("loanID", isEqualTo: loanID).get();

    final loans = querySnapshot.docs
        .map((doc) => Loan.fromJson(doc.data()))
        .toList();
    return loans[0];
  }

  Future createLoan(Book book, Library library,) async{
    String userID = await userDatabase.getUserID();
    DateTime loanDate = DateTime.now();
    DateTime endDate = loanDate.add(const Duration(days: 14));
    Loan newLoan = Loan.loan(loanID: Uuid().v4(), bookID: book.bookID, libraryID: library.libraryID, userID: userID, loanDate: loanDate, endDate: endDate, extended: false, ended: false);
    await FirebaseFirestore.instance.collection("loans").doc(newLoan.loanID).set(newLoan.toJson());
  }

  Future updateLoan(Loan loan) async{
    await FirebaseFirestore.instance.collection("loans").doc(loan.loanID).update(loan.toJson());
  }

  Future extendLoan(Loan loan) async{
    DateTime endDate = loan.endDate;
    endDate.add(const Duration(days: 14));
    Loan updatedLoan = Loan.loan(loanID: loan.loanID, bookID: loan.bookID, libraryID: loan.libraryID, userID: loan.userID, loanDate: loan.loanDate, endDate: endDate, extended: true, ended: loan.ended);
    updateLoan(updatedLoan);
  }

  Future endLoan(Loan loan) async{
    Loan updatedLoan = Loan.loan(loanID: loan.loanID, bookID: loan.bookID, libraryID: loan.libraryID, userID: loan.userID, loanDate: loan.loanDate, endDate: loan.endDate, extended: loan.extended, ended: true);
    updateLoan(updatedLoan);
  }

  Future<List<Loan>> getUserLoanHistory() async{
    String userID = await userDatabase.getUserID();
    final database = FirebaseFirestore.instance.collection("loans");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("userID", isEqualTo: userID).get();

    final loans = querySnapshot.docs
        .map((doc) => Loan.fromJson(doc.data()))
        .toList();
    return loans;
  }

  Future<List<Loan>> getLibraryLoans() async{
    String librarianID = await userDatabase.getUserID();
    Library? library = await libraryDatabase.getUserLibrary(librarianID);

    if(library != null){
      final database = FirebaseFirestore.instance.collection("loans");
      QuerySnapshot<Map<String, dynamic>>? querySnapshot;
      querySnapshot = await database.where("libraryID", isEqualTo: library.libraryID).get();
      final loans = querySnapshot.docs
          .map((doc) => Loan.fromJson(doc.data()))
          .toList();
      return loans;
    }
    return [];
  }


  //Methods for MyLoans

  Future<List<LoanElement>> getAllUserLoans() async {
    String userID = await userDatabase.getUserID();
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("loansList")
        .doc(userID)
        .get();

    final loanList = documentSnapshot.get("loanList");
    final loans = loanList.map<LoanElement>((element) => LoanElement.fromJson(element)).toList();

    return loans;
  }

  Future createLoanRecordForUser() async {
    String userID = await userDatabase.getUserID();
    await booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .set({"loanList": []});
  }

  Future updateLoanList(List<LoanElement> newList) async{
    String userID = await userDatabase.getUserID();
    final jsonList = newList.map((e) => e.toJson()).toList();

    await booksDatabase
        .getFirestore()!
    .collection("loansList")
    .doc(userID)
    .set({
      "loanList": jsonList
    });
  }

  Future cleanLoanList() async {
    String userID = await userDatabase.getUserID();
    await booksDatabase
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