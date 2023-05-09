import 'package:client/globals.dart';
import 'package:client/models/authorModel/author.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/bookModel/book.dart';
import 'book_details.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({Key? key, required this.bookID}) : super(key: key);
  final String bookID;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  var pixelRatio = MediaQueryData.fromWindow(WidgetsBinding.instance.window)
      .devicePixelRatio;

  @override
  Widget build(BuildContext context) {
    final scaleHeight =
        WidgetsBinding.instance.window.physicalSize.height / pixelRatio * 0.02;

    final scaleWidth = kIsWeb ? MediaQuery.of(context).size.width / 5 : 0.0;

    return Scaffold(
      body: FutureBuilder(
          future: Future.wait([
            booksDatabase.getBookByID(widget.bookID),
            authorsDatabase.getAuthorsByBookId(widget.bookID),
          ]),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              var book = snapshot.data![0] as Book;
              var authors = snapshot.data![1] as List<Author>;
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: scaleWidth,
                    vertical: kIsWeb ? scaleHeight * 3 : scaleHeight),
                child: Stack(
                  children: [
                    BookDetails(
                        book: book, authors: authors),
                    CarouselSlider(
                        items: book.images
                            .map(
                              (e) => GestureDetector(
                                child: Image.network(e),
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          height: 250,
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
                  ],
                ),
              );
            }
          }),
    );
  }
}
