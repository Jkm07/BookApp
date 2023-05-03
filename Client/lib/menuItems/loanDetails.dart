import 'package:client/globals.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:flutter/material.dart';

import '../models/bookModel/book.dart';
import '../models/loanModel/loan.dart';

class LoanDetails extends StatefulWidget {
  LoanDetails(
      {Key? key,
      required this.loan,
      required this.book,
      required this.library,
      required this.screenType,
      required this.callBack})
      : super(key: key);

  Loan loan;
  Book book;
  Library library;
  String screenType;
  Function callBack;

  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  Loan? updatedLoan;

  @override
  Widget build(BuildContext context) {
    return Container();
    // return FutureBuilder(
    //     future: loansDatabase.getLoanByID(widget.loan.loanID),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         updatedLoan = snapshot.data[0];
    //         return Scaffold(
    //           appBar: AppBar(
    //             title: const Text("Loan Details"),
    //           ),
    //           body: SingleChildScrollView(
    //             padding: paddingGlobal,
    //             child: Column(
    //               children: [
    //
    //               ],
    //             ),
    //           ),
    //         );
    //       } else {
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //     });
  }
}