import 'package:client/screens/loanDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../globals.dart';
import '../models/bookModel/book.dart';
import '../models/libraryModel/library.dart';
import '../models/loanModel/loan.dart';

class LoanHistoryElement extends StatefulWidget {
  LoanHistoryElement({
    Key? key,
    required this.loan,
    required this.screenType,
    required this.callBack,
  }) : super(key: key);

  Loan loan;
  String screenType;
  Function callBack;

  @override
  State<LoanHistoryElement> createState() => _LoanHistoryElementState();
}

class _LoanHistoryElementState extends State<LoanHistoryElement> {
  late Book book;
  late Library library;
  bool loaded = false;

  @override
  void initState() {
    getData();
  }

  getData() async {
    library = await libraryDatabase.getLibrary(widget.loan.libraryID);
    book = await booksDatabase.getBookByID(widget.loan.bookID);
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loaded == false) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => LoanDetails(
                      loan: widget.loan,
                      book: book,
                      library: library,
                      screenType: widget.screenType,
                      callBack: widget.callBack,))));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: widget.loan.ended == true ? Colors.red : Colors.green,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: SizedBox(
            height: scaleHeight * 4,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    book.images[0],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                spaceWidth(kIsWeb ? scaleHeight * 3 : scaleHeight),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FittedBox(
                          child: Text(
                        book.title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis),
                      )),
                      FittedBox(
                          child: Text(
                        "From: ${library.name}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
