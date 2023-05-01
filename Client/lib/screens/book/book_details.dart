import 'package:flutter/material.dart';
import '../../models/authorModel/author.dart';
import '../../models/bookModel/book.dart';
import '../../models/publisherModel/publisher.dart';
import 'book_brief.dart';
import 'book_footer.dart';

class SpacerColumn extends SizedBox {
  const SpacerColumn({super.key, super.height = 10});
}

class BookDetails extends StatelessWidget {
  const BookDetails(
      {Key? key,
      required this.book,
      required this.publisher,
      required this.authors})
      : super(key: key);
  final Book book;
  final Publisher publisher;
  final List<Author> authors;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      margin: const EdgeInsets.only(top: 70.0, left: 20, right: 20),
      color: Theme.of(context).colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Center(
          child: Column(
            children: [
              Text(
                book.title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SpacerColumn(),
              Text(
                authors.first.authorName,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const SpacerColumn(),
              BookBrief(
                  book.numberOfPages, book.language, book.yearPublication),
              const SpacerColumn(),
              Text(
                book.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              BookFooter(book),
              const SpacerColumn(),
            ],
          ),
        ),
      ),
    );
  }
}
