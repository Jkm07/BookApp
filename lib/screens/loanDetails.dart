import 'package:client/globals.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/screens/loginScreen.dart';
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

  Widget uniContainer(String text, BuildContext context,
      [Color? color, Function? onTap]) {
    return GestureDetector(
      onTap: () => onTap != null ? onTap() : (){},
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color ?? Colors.lightGreenAccent,
        ),
        child: Text(
          text,
          style:
              TextStyle(overflow: TextOverflow.ellipsis, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loansDatabase.getLoanByID(widget.loan.loanID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            updatedLoan = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Loan Details"),
              ),
              body: SingleChildScrollView(
                  padding: paddingGlobal,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            Image.network(
                              widget.book.images[0],
                              fit: BoxFit.fitHeight,
                            ),
                            space(),
                          ],
                        ),
                      )),
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            uniContainer(widget.book.title, context),
                            space(),
                            uniContainer(
                                "From: ${widget.library.name}", context),
                            space(),
                            uniContainer(
                                "Rental date: " +
                                    updatedLoan!.loanDate.toString(),
                                context),
                            space(),
                            uniContainer(
                                "Rental end date: " +
                                    updatedLoan!.endDate.toString(),
                                context),
                            space(),
                            if( !updatedLoan!.ended )...{
                              uniContainer(
                                  "Extend",
                                  context,
                                  updatedLoan!.extended
                                      ? Colors.grey.shade400
                                      : Colors.black, () async {
                                if (updatedLoan!.extended) {
                                  dialogTrigger(context, "Failed operation",
                                      "You have extended the rental of the book, please return the book.");
                                } else {
                                  await loansDatabase.extendLoan(updatedLoan!);
                                  dialogTrigger(context, "Rental extend", "Rental date has been extended succesfully");
                                  widget.callBack();
                                  setState(() {});
                                }
                              }),
                              space(),
                              if (widget.screenType != "user") ...{
                                uniContainer("End rental", context, Colors.red,
                                        () async {
                                      await loansDatabase.endLoan(
                                          updatedLoan!, widget.book, widget.library);
                                      dialogTrigger(context, "Rental end", "The rental has ended");
                                      widget.callBack();
                                      setState(() {});
                                    })
                              }
                            }else...{
                              uniContainer("Rental ended", context, Colors.red),
                            }
                          ],
                        ),
                      )),
                    ],
                  )),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
