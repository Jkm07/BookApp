import 'package:client/globals.dart';
import 'package:client/models/bookModel/book.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:flutter/material.dart';
import 'text_feature_list.dart';
import 'book_library_list.dart';

class HorizontalDivider extends SizedBox {
  const HorizontalDivider({super.key}) : super(height: 9);
}

class BookFooter extends StatefulWidget {
  final Book _book;

  const BookFooter(this._book, {super.key});

  @override
  State<BookFooter> createState() => _BookFooter();
}

class _BookFooter extends State<BookFooter> {
  void Function()? buttonPointer;

  Library? chosenLibrary;

  Future<List<Library>> getLibraries() async {
    return await libraryDatabase
        .getLibrariesWhereBookIsAvail(widget._book.bookID);
  }

  void borrowBook() {
    loansDatabase.addBookToLoanList(
        widget._book.bookID, chosenLibrary!.libraryID);
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
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 25,
              color: Colors.black,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextFeatureList("Category", widget._book.category),
                    const HorizontalDivider(),
                    TextFeatureList("Cover type", widget._book.coverType),
                    const HorizontalDivider(),
                    TextFeatureList("Issue number", widget._book.issueNumber),
                    const HorizontalDivider(),
                    TextFeatureList("Published", widget._book.publishedDate),
                    const HorizontalDivider(),
                    TextFeatureList("ISBN", widget._book.ISBN),
                    const HorizontalDivider(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
