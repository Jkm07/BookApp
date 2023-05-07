import 'package:client/models/bookModel/book.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/screens/book/book_library_list.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as global;

class BookBorrow extends StatefulWidget {
  final Book book;

  const BookBorrow({super.key, required this.book});

  @override
  State<StatefulWidget> createState() => _BookBorrowState();
}

class _BookBorrowState extends State<BookBorrow> {
  void Function()? buttonPointer;
  Library? chosenLibrary;

  Future<List<Library>> getLibraries() async {
    return await global.libraryDatabase
        .getLibrariesWhereBookIsAvail(widget.book.bookID);
  }

  void borrowBook() {
    global.loansDatabase
        .addBookToLoanList(widget.book.bookID, chosenLibrary!.libraryID);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Success. You added book to your borrow list")));

    return;
  }

  void chooseLibrary(Library? library) {
    setState(() {
      chosenLibrary = library;
      buttonPointer = library == null ? null : borrowBook;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ActionChip(
              avatar: const Icon(
                Icons.menu_book_outlined,
                size: 20,
              ),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Text("Borrow"),
              ),
              labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: buttonPointer),
          FutureBuilder(
              future: getLibraries(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return LibraryList(snapshot.data!, chooseLibrary);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })
        ],
      ),
    );
  }
}
