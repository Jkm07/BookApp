import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../globals.dart';
import '../../models/authorModel/author.dart';
import '../../models/bookModel/book.dart';
import '../../models/libraryModel/library.dart';
import '../../models/publisherModel/publisher.dart';
import '../../models/userModel/userLibrary.dart';
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

  late TextEditingController quantityController;
  late UserLibrary user;
  Library? library;
  List<Library>? bookAvailable;

  @override
  void initState(){
    //do zwrocenia listy bibliotek gdzie ksiazka jest dostepna, tylko gdy przeglada librarian
    getData();

    //do deklaracji dostepnosci ksiazki
    quantityController = new TextEditingController(text: "0");
  }

  getData() async {
    user = await userDatabase.getCurrentUser();
    if(user.userType == "librarian"){
      library = await libraryDatabase.getUserLibrary(user.userID);
      if(library != null){
        bookAvailable = await libraryDatabase.getLibrariesWhereBookIsAvail(widget.book.bookID);
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    final scaleHeight =
        WidgetsBinding.instance.window.physicalSize.height / pixelRatio * 0.02;

    final scaleWidth = kIsWeb ? MediaQuery.of(context).size.width / 5 : 0.0;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: scaleWidth,
            vertical: kIsWeb ? scaleHeight * 3 : scaleHeight),
        child: Stack(
          children: [
            BookDetails(
                book: widget.book,
                publisher: widget.publisher,
                authors: widget.authors),
            CarouselSlider(
                items: widget.book.images
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
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                )),
          ],
        ),
      ),
    );
  }
}