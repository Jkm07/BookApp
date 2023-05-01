import 'package:flutter/material.dart';
import '../../models/authorModel/author.dart';
import '../../models/bookModel/book.dart';
import '../../models/publisherModel/publisher.dart';


class BookDetails extends StatelessWidget {
  const BookDetails({Key? key,
    required this.book,
    required this.publisher,
    required this.authors})
      : super(key: key);
  final Book book;
  final Publisher publisher;
  final List<Author> authors;


  @override
  Widget build(BuildContext context)
  {
    return Card(
      margin: const EdgeInsets.only(top: 125.0),
      color: Theme
          .of(context)
          .colorScheme
          .background,
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            children: [
              Text(
                book.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10),
              Text(
                authors.first.authorName,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 10),
              Text(
                book.category,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Theme.of(context).colorScheme.primary),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
