import 'package:client/bookModel/book.dart';
import 'package:client/publisherModel/publisher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../authorModel/author.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key, required this.book, required this.publisher, required this.authors}) : super(key: key);
  final Book book;
  final Publisher publisher;
  final List<Author> authors;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {

  var pixelRatio = MediaQueryData.fromWindow(WidgetsBinding.instance.window).devicePixelRatio;
  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;

  Widget universalContainer( String text, double height ){
    return Container(
      height: height * 4,
      decoration: BoxDecoration(
          color: const Color(0xff756651),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            width: 2,
            color: Colors.black,
          )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold ),
        ),
      ),
    );
  }

  Row createRow( String parameterName, String text, double height ){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: height * 2,
            decoration: BoxDecoration(
                color: const Color(0xffCCB18C),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                )
            ),
            child: Center(
              child: Text(
                parameterName,
                style: TextStyle( color: Colors.white ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: height * 2,
            decoration: BoxDecoration(
                color: const Color(0xffCCB18C),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                )
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle( color: Colors.white ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> displayAuthors(double height){
    List<Widget> widgets = [];
    for( int i = 0; i < widget.authors.length; i++ )
    {
      widgets.add( createRow("#${i+1} Author", widget.authors[i].authorName, height) );
    }
    return widgets;
  }

  Widget space( [double? value] ){
    return SizedBox(
      height: value == null ? scaleHeight : value,
    );
  }

  @override
  Widget build(BuildContext context) {
    scaleHeight = WidgetsBinding.instance.window.physicalSize.height / pixelRatio * 0.02;
    scaleWidthWeb = WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 5;
    scaleWidthApp =  WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 20;

    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: Icon(
          Icons.menu_book_outlined,
        ),
        title: FittedBox(child: Text(widget.book.title)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric( horizontal: kIsWeb ? scaleWidthWeb : scaleWidthApp, vertical: kIsWeb ? scaleHeight * 3 : scaleHeight),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 2 / 1,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: NetworkImage(widget.book.images[0]),
                              fit: BoxFit.contain
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: scaleHeight,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            widget.book.title,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        space( scaleHeight * 1.5 ),
                        Center(
                          child: Text(
                            "by  ${widget.authors[0].authorName}",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        space( scaleHeight * 1.5 ),
                        Center(
                          child: Text(
                              widget.book.category,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            universalContainer("Authors", scaleHeight),
            ...displayAuthors(scaleHeight),
            universalContainer("Book details", scaleHeight),
            createRow( "ISBN", widget.book.ISBN, scaleHeight),
            createRow("Number of Pages", widget.book.numberOfPages, scaleHeight),
            createRow("Cover type", widget.book.coverType, scaleHeight),
            createRow("Language", widget.book.language, scaleHeight),
            createRow("Publisher", widget.publisher.publisherName, scaleHeight),
            createRow("Publisher date", widget.book.publishedDate, scaleHeight),
            createRow("Publication year", widget.book.yearPublication, scaleHeight),
            createRow("Issue number", widget.book.issueNumber, scaleHeight),
          ],
        ),
      ),
    );
  }
}