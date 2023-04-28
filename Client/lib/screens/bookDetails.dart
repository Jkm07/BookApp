import 'package:client/bookModel/book.dart';
import 'package:client/publisherModel/publisher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../authorModel/author.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          )
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle( fontWeight: FontWeight.bold ),
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
            height: height * 3,
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
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: height * 3,
            decoration: BoxDecoration(
                color: const Color(0xffCCB18C),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                )
            ),
            child: Center(
              child: Text(
                text,
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
      appBar: AppBar(
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
                      child: CarouselSlider(
                          items: widget.book.images.map((e) => GestureDetector(child: Image.network(e), onTap: () => print("123"),),).toList(),
                          options: CarouselOptions(
                            height: 400,
                            aspectRatio: 16/9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(milliseconds: 1000),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: false,
                            scrollDirection: Axis.horizontal,
                          )
                      ),
                  ),
                  SizedBox(
                    width: scaleHeight,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            widget.book.title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        space( scaleHeight * 1.5 ),
                        Center(
                          child: Text(
                            "by  ${widget.authors[0].authorName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        space( scaleHeight * 1.5 ),
                        Center(
                          child: Text(
                              widget.book.category,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            space(scaleHeight * 2),
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
            space(scaleHeight * 2),
            universalContainer("Description", scaleHeight),
            Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(scaleHeight),
                child: Text(
                  widget.book.description,
                ),
              ),
              decoration: BoxDecoration(
                  color: const Color(0xffCCB18C),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  border: Border.all(
                    width: 2,
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}