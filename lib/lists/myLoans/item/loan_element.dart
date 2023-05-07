import 'package:client/screens/book/book_screen.dart';
import 'package:flutter/material.dart';
import '../../../globals.dart' as global;
import '../../../models/loanElement/loan.dart';

class LoanListElement extends StatefulWidget {
  const LoanListElement(
      {Key? key, required this.loanElement, required this.quantity})
      : super(key: key);

  final LoanElement loanElement;
  final int quantity;

  @override
  State<LoanListElement> createState() => _LoanListElementState();
}

class _LoanListElementState extends State<LoanListElement> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          global.libraryDatabase.getLibrary(widget.loanElement.libraryID),
          global.booksDatabase.getBookByID(widget.loanElement.bookID),
          global.authorsDatabase.getAuthorsByBookId(widget.loanElement.bookID),
          global.userDatabase.getCurrentUser(),
        ]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            margin: const EdgeInsets.only(bottom: 5),
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
            child: ClipRect(
              child: Banner(
                message: widget.quantity > 0
                    ? "Available: ${widget.quantity}"
                    : "Not Available",
                location: BannerLocation.bottomEnd,
                color: widget.quantity > 0
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.error,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          image: NetworkImage(snapshot.data![1].images[0]),
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        )),
                    title: Text(snapshot.data![1].title),
                    subtitle: Text(
                        '${snapshot.data![0].name}\n${snapshot.data![0].address}'),
                    onTap: () => global.setScreen(BookDetailsScreen(
                        book: snapshot.data![1],
                        authors: snapshot.data![2],
                        user: snapshot.data![3])),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
