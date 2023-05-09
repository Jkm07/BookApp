import 'package:client/lists/myLoans/data/QuanityNotifier.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../globals.dart' as global;
import '../../../models/bookModel/book.dart';
import '../../../models/loanElement/loan.dart';

class LoanListElement extends StatefulWidget {
  const LoanListElement(
      {Key? key, required this.loanElement, required this.index})
      : super(key: key);

  final LoanElement loanElement;
  final int index;

  @override
  State<LoanListElement> createState() => _LoanListElementState();
}

class _LoanListElementState extends State<LoanListElement> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value:
          global.libraryDatabase.getLibraryStream(widget.loanElement.libraryID),
      child: FutureBuilder(
          future: Future.wait([
            global.booksDatabase.getBookByID(widget.loanElement.bookID),
          ]),
          builder: (context, snapshot) {
            if (!snapshot.hasData || Provider.of<Library?>(context) == null) {
              return const Center(child: CircularProgressIndicator());
            }
            var library = Provider.of<Library>(context);
            var book = snapshot.data![0] as Book;
            var quantity =
                int.parse(library.booksAndQuantity[book.bookID] ?? "0");
            Provider.of<QuantityNotifier>(context, listen: false)
                .set(widget.index, quantity);
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
                  message:
                      quantity > 0 ? "Available: $quantity" : "Not Available",
                  location: BannerLocation.bottomEnd,
                  color: quantity > 0
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.error,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image(
                            image: NetworkImage(book.images[0]),
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          )),
                      title: Text(book.title),
                      subtitle: Text('${library.name}\n${library.address}'),
                      onTap: () => context.go("/book/details/${book.bookID}"),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
