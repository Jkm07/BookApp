import 'package:client/screens/bookDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../globals.dart' as globals;
import '../models/authorModel/author.dart';
import '../models/bookModel/book.dart';
import '../models/publisherModel/publisher.dart';

class UniversalBooksList extends StatefulWidget {
  const UniversalBooksList(
      {Key? key,
      required this.filterType,
      required this.value,
      required this.search,
      required this.sort})
      : super(key: key);

  final String filterType;
  final String value;
  final String search;
  final String sort;

  @override
  State<UniversalBooksList> createState() => _UniversalBooksListState();
}

class _UniversalBooksListState extends State<UniversalBooksList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: globals.booksDatabase.getBooksFromCategory(
            widget.filterType, widget.value, widget.search, widget.sort),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: kIsWeb ? 4 : 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) =>
                  BookElement(book: snapshot.data![index]),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class BookElement extends StatefulWidget {
  const BookElement({super.key, required this.book});

  final Book book;

  @override
  State<BookElement> createState() => _BookElementState();
}

class _BookElementState extends State<BookElement> {
  @override
  void initState() {
    super.initState();
    //getParameters();
  }

  Widget space([double? value]) {
    return SizedBox(
      height: value ?? scaleHeight,
    );
  }

  Future<Publisher> getParameters() async {
    authors =
        await (globals.authorsDatabase.getAuthorsList(widget.book.authorsID));
    publisher =
        await (globals.publisherDatabase.getPublisher(widget.book.publisherID));
    return publisher;
  }

  Container universalContainer(String text, bool bold) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.03,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 1, color: Colors.grey)),
        child: Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: bold ? FontWeight.bold : null),
            textAlign: TextAlign.center,
          ),
        ));
  }

  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;
  late List<Author> authors;
  late Publisher publisher;

  @override
  Widget build(BuildContext context) {
    scaleHeight = MediaQuery.of(context).size.height * 0.02;
    scaleWidthWeb = MediaQuery.of(context).size.width / 5;
    scaleWidthApp = MediaQuery.of(context).size.width / 20;

    return FutureBuilder(
        future: getParameters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => BookDetailsScreen(
                          book: widget.book,
                          publisher: publisher,
                          authors: authors)))),
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(widget.book.images[0]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  universalContainer(widget.book.title, true),
                  universalContainer(authors[0].authorName, false),
                  universalContainer(widget.book.category, false),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
