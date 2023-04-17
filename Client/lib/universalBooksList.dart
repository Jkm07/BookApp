import 'package:client/authorModel/author.dart';
import 'package:client/publisherModel/publisher.dart';
import 'package:client/screens/bookDetails.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'bookModel/book.dart';
import 'globals.dart' as globals;

class UniversalBooksList extends StatefulWidget {
  const UniversalBooksList({Key? key, this.category, this.search, this.sort}) : super(key: key);

  final String? category;
  final String? search;
  final String? sort;

  @override
  State<UniversalBooksList> createState() => _UniversalBooksListState();
}

class _UniversalBooksListState extends State<UniversalBooksList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
        future: globals.booksDatabase.getBooksFromCategory("all", "", ""),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: kIsWeb ? 4 : 2,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.02,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (context, index) => BookElement(book: snapshot.data![index]),
            );
          } else {
            return Center(child: CircularProgressIndicator());
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

  @override void initState() {
    super.initState();
    //getParameters();
  }

  Widget space( [double? value] ){
    return SizedBox(
      height: value == null ? scaleHeight : value,
    );
  }

  Future<Publisher> getParameters() async
  {
    authors = await (globals.authorsDatabase.getAuthorsList(widget.book.authorsID));
    publisher = await ( globals.publisherDatabase.getPublisher(widget.book.publisherID));
    return publisher;
  }

  Container universalContainer(String text, bool bold){
    return Container(
        height: MediaQuery.of(context).size.height * 0.03,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            width: 1,
            color: Colors.grey
          )
        ),
        child: Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle( color: Colors.white, fontWeight: bold ? FontWeight.bold : null ),
            textAlign: TextAlign.center,
          ),
        )
    );
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
      builder: (context, snapshot){
        if (snapshot.hasData){
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => BookDetailsScreen(book: widget.book, publisher: publisher, authors: authors) ))),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(widget.book.images[0]),
                              fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                  ),
                  universalContainer(widget.book.title, true),
                  universalContainer(authors[0].authorName, false),
                  universalContainer(widget.book.category, false),
                ],
              ),
            ),
          );
        }
        else
        {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}