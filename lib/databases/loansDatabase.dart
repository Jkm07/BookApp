import 'package:client/models/loanElement/loan.dart';
import 'package:client/models/loanModel/loan.dart';
import 'package:client/models/userModel/userLibrary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import '../globals.dart';
import '../models/bookModel/book.dart';
import '../models/libraryModel/library.dart';

class LoansDatabase {
  //Methods for LoanHistory
  Future<Loan> getLoanByID(String loanID) async {
    final database = FirebaseFirestore.instance.collection("loans");
    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    querySnapshot = await database.where("loanID", isEqualTo: loanID).get();

    final loans =
        querySnapshot.docs.map((doc) => Loan.fromJson(doc.data())).toList();
    return loans[0];
  }

  Future createLoan(String bookId, String libraryId) async {
    String userID = await userDatabase.getUserID();
    DateTime loanDate = DateTime.now();
    DateTime endDate = loanDate.add(const Duration(days: 14));
    Loan newLoan = Loan.loan(
        loanID: Uuid().v4(),
        bookID: bookId,
        libraryID: libraryId,
        userID: userID,
        loanDate: loanDate,
        endDate: endDate,
        extended: false,
        ended: false);
    await libraryDatabase.updateBookQuantityWhenBorrowOrEnded(
        libraryId, bookId, -1);
    await FirebaseFirestore.instance
        .collection("loans")
        .doc(newLoan.loanID)
        .set(newLoan.toJson());
  }

  Future updateLoan(Loan loan) async {
    await FirebaseFirestore.instance
        .collection("loans")
        .doc(loan.loanID)
        .update(loan.toJson());
  }

  Future extendLoan(Loan loan) async {
    DateTime endDate = loan.endDate.add(Duration(days: 14));
    Loan updatedLoan = Loan.loan(
        loanID: loan.loanID,
        bookID: loan.bookID,
        libraryID: loan.libraryID,
        userID: loan.userID,
        loanDate: loan.loanDate,
        endDate: endDate,
        extended: true,
        ended: loan.ended);
    updateLoan(updatedLoan);
  }

  Future deleteLoanHistory(UserLibrary user) async {
    await FirebaseFirestore.instance
        .collection("loans")
        .doc(user.userID)
        .delete();
  }

  Future endLoan(Loan loan, Book book, Library library) async {
    Loan updatedLoan = Loan.loan(
        loanID: loan.loanID,
        bookID: loan.bookID,
        libraryID: loan.libraryID,
        userID: loan.userID,
        loanDate: loan.loanDate,
        endDate: loan.endDate,
        extended: loan.extended,
        ended: true);
    updateLoan(updatedLoan);
    await libraryDatabase.updateBookQuantityWhenBorrowOrEnded(
        library.libraryID, book.bookID, 1);
  }

  Future<List<Loan>> getUserLoanHistory(
      {bool current = true, bool overdue = true, bool ended = true}) async {
    String userID = await userDatabase.getUserID();
    final database = FirebaseFirestore.instance.collection("loans");

    QuerySnapshot<Map<String, dynamic>>? querySnapshot;
    var queryFilters = database.where("userID", isEqualTo: userID);
    if (!current && !overdue) {
      queryFilters = queryFilters.where("ended", isEqualTo: true);
    }
    if (!ended) queryFilters = queryFilters.where("ended", isEqualTo: false);

    querySnapshot = await queryFilters.get();
    final loans =
        querySnapshot.docs.map((doc) => Loan.fromJson(doc.data())).toList();
    return loans;
  }

  Future<List<Loan>> getLibraryLoans(
      {bool current = true, bool overdue = true, bool ended = true}) async {
    String librarianID = await userDatabase.getUserID();
    Library? library = await libraryDatabase.getUserLibrary(librarianID);

    if (library != null) {
      final database = FirebaseFirestore.instance.collection("loans");

      QuerySnapshot<Map<String, dynamic>>? querySnapshot;
      var queryFilters =
          database.where("libraryID", isEqualTo: library.libraryID);
      if (!current && !overdue) {
        queryFilters = queryFilters.where("ended", isEqualTo: true);
      }
      if (!ended) queryFilters = queryFilters.where("ended", isEqualTo: false);

      querySnapshot = await queryFilters.get();
      final loans =
          querySnapshot.docs.map((doc) => Loan.fromJson(doc.data())).toList();
      return loans;
    }
    return [];
  }

  //Methods for MyLoans

  Future deleteMyLoans(UserLibrary user) async {
    await FirebaseFirestore.instance
        .collection("loansList")
        .doc(user.userID)
        .delete();
  }

  Future<List<LoanElement>> getAllUserLoans() async {
    String userID = await userDatabase.getUserID();
    var documentSnapshot = await FirebaseFirestore.instance
        .collection("loansList")
        .doc(userID)
        .get();

    final loanList = documentSnapshot.get("loanList");
    final loans = loanList
        .map<LoanElement>((element) => LoanElement.fromJson(element))
        .toList();

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

  Future updateLoanList(List<LoanElement> newList) async {
    String userID = await userDatabase.getUserID();
    final jsonList = newList.map((e) => e.toJson()).toList();

    await booksDatabase
        .getFirestore()!
        .collection("loansList")
        .doc(userID)
        .set({"loanList": jsonList});
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
    if (!(await checkBookOnLoanList(bookID, libraryID))) {
      LoanElement newLoan =
          LoanElement.loan(bookID: bookID, libraryID: libraryID, quantity: "1");
      loans.add(newLoan);
      updateLoanList(loans);
    }
  }

  Future deleteBookOnLoanList(String bookID, String libraryID) async {
    List<LoanElement> loans = await getAllUserLoans();
    int? index;
    for (int i = 0; i < loans.length; i++) {
      if (loans[i].bookID == bookID && loans[i].libraryID == libraryID) {
        index = i;
        break;
      }
    }

    if (index != null) {
      loans.removeAt(index);
    }
    updateLoanList(loans);
  }

  Future checkBookOnLoanList(String bookID, String libraryID) async {
    List<LoanElement> loans = await getAllUserLoans();
    for (int i = 0; i < loans.length; i++) {
      if (loans[i].bookID == bookID && loans[i].libraryID == libraryID) {
        return true;
      }
    }
    return false;
  }

  Future<int> validateLoan(LoanElement loan) async {
    final library = await libraryDatabase.getLibrary(loan.libraryID);
    if (library.booksAndQuantity.containsKey(loan.bookID)) {
      return int.parse(library.booksAndQuantity[loan.bookID]!);
    }
    return 0;
  }

  Future<bool> acceptBorrowList(List<LoanElement> loans) async {
    // for (var loan in loans) {
    //   if (await validateLoan(loan) <= 0) return false;
    // }

    for (var loan in loans) {
      await createLoan(loan.bookID, loan.libraryID);
    }

    await cleanLoanList();
    return true;
  }
}
