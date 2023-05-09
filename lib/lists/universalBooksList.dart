import 'package:client/models/userModel/userLibrary.dart';
import 'package:client/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:text_scroll/text_scroll.dart';
import '../globals.dart';
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
        future: booksDatabase.getBooksFromCategory(
            widget.filterType, widget.value, widget.search, widget.sort),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  BookElement(book: snapshot.data![index]),
            );
          } else {
            return const Loading();
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

  late UserLibrary user;

  Future<Publisher> getParameters() async {
    user = await userDatabase.getCurrentUser();
    authors = await (authorsDatabase.getAuthorsList(widget.book.authorsID));
    publisher = await (publisherDatabase.getPublisher(widget.book.publisherID));
    return publisher;
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
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1))
                  ]),
              child: ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image(
                      image: NetworkImage(widget.book.images[0]),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )),
                title: Text(widget.book.title),
                subtitle: TextScroll(
                  widget.book.description,
                  velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
                ),
                trailing: isLibrarian(user)
                    ? IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.primary,
                      )
                    : null,
                onTap: () => context.go("/book/details/${widget.book.bookID}"),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
