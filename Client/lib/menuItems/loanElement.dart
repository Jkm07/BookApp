import 'package:client/models/libraryModel/library.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../models/bookModel/book.dart';
import '../models/loanElement/loan.dart';

class LoanListElement extends StatefulWidget {
  LoanListElement({Key? key, required this.loanElement, required this.callBack})
      : super(key: key);

  LoanElement loanElement;
  Function callBack;

  @override
  State<LoanListElement> createState() => _LoanListElementState();
}

class _LoanListElementState extends State<LoanListElement> {
  late Book book;
  late Library library;
  bool loaded = false;

  @override
  void initState() {
    getData();
  }

  getData() async {
    library = await libraryDatabase.getLibrary(widget.loanElement.libraryID);
    book = await booksDatabase.getBookByID(widget.loanElement.bookID);
    setState(() {
      loaded = true;
    });
  }

  Widget build(BuildContext context) {
    if (loaded == false) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
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
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis),
                        )),
                      ],
                    ),
                  ),
                  Text(
                    int.parse(library.booksAndQuantity[book.bookID]!) > 0
                        ? "Available: ${library.booksAndQuantity[book.bookID]!}"
                        : "Not available",
                  ),
                  TextButton(
                      onPressed: () async {
                        bool validation = await loansDatabase.validateLoan(
                            widget.loanElement, library, book);
                        if (validation) {
                          await loansDatabase.createLoan(book, library);
                          await loansDatabase.deleteBookOnLoanList(book.bookID, library.libraryID);
                          dialogTrigger(context, "Book has been borrowed",
                              "Please, pick up your book in ${library.name} address: ${library.address}");
                        } else {
                          dialogTrigger(context, "Can not borrow book",
                              "You can not borrow ${book.title} from: ${library.name} because it is not available now!");
                        }
                        widget.callBack();
                      },
                      child: Container(
                        child: Text("Borrow"),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () async {

                await loansDatabase.deleteBookOnLoanList(
                    book.bookID, library.libraryID);
                widget.callBack();
              },
              child: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
            ),
          ),
        ],
      );
    }
  }
}
