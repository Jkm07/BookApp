import 'package:client/globals.dart';
import 'package:client/models/bookModel/book.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/models/loanModel/loan.dart';
import 'package:client/models/userModel/userLibrary.dart';
import 'package:flutter/material.dart';

class LoanMonad {
  final Loan loan;
  final Library library;
  final Book book;
  final UserLibrary user;

  LoanMonad._create(this.loan, this.library, this.book, this.user);

  static Future<LoanMonad> create(
      Loan loan, Library? library, Book? book, UserLibrary? user) async {
    Library getLibrary =
        library ?? await libraryDatabase.getLibrary(loan.libraryID);
    Book getBook = book ?? await booksDatabase.getBookByID(loan.bookID);
    UserLibrary getUser = user ?? await userDatabase.refreshUser(loan.userID);
    return LoanMonad._create(loan, getLibrary, getBook, getUser);
  }

  String dateText() {
    String main =
        "${loan.endDate.day}.${loan.endDate.month}.${loan.endDate.year}";
    String returnString = loan.ended ? "Returned before: " : "Return to: ";
    return returnString + main;
  }

  Color colorOfLoan(BuildContext context) {
    if (loan.ended) return Colors.grey;
    if (loan.endDate.isBefore(DateTime.now())) return Theme.of(context).colorScheme.error;
    return Theme.of(context).colorScheme.background;
  }
}
