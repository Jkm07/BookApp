import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/authorModel/author.dart';
import '../../models/bookModel/book.dart';
import '../../models/publisherModel/publisher.dart';
import 'book_details.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen(
      {Key? key,
      required this.book,
      required this.publisher,
      required this.authors})
      : super(key: key);
  final Book book;
  final Publisher publisher;
  final List<Author> authors;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  var pixelRatio = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
      .devicePixelRatio;
  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;

  Widget universalContainer(String text, double height) {
    return Container(
      height: height * 4,
      decoration: BoxDecoration(
          color: const Color(0xff756651),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(
            width: 2,
          )),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Row createRow(String parameterName, String text, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: height * 3,
            decoration: BoxDecoration(
                color: const Color(0xffCCB18C),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: Colors.black,
                )),
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
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                )),
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

  List<Widget> displayAuthors(double height) {
    List<Widget> widgets = [];
    for (int i = 0; i < widget.authors.length; i++) {
      widgets.add(
          createRow("#${i + 1} Author", widget.authors[i].authorName, height));
    }
    return widgets;
  }

  Widget space([double? value]) {
    return SizedBox(
      height: value ?? scaleHeight,
    );
  }

  @override
  Widget build(BuildContext context) {
    scaleHeight =
        WidgetsBinding.instance.window.physicalSize.height / pixelRatio * 0.02;
    scaleWidthWeb =
        WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 5;
    scaleWidthApp =
        WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 20;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: kIsWeb ? scaleWidthWeb : scaleWidthApp,
            vertical: kIsWeb ? scaleHeight * 3 : scaleHeight),
        child: Stack(
          children: [
            BookDetails(book: widget.book, publisher: widget.publisher, authors: widget.authors),
            AspectRatio(
              aspectRatio: 2 / 1,
              child: CarouselSlider(
                  items: widget.book.images
                      .map(
                        (e) => GestureDetector(
                      child: Image.network(e),
                    ),
                  )
                      .toList(),
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
