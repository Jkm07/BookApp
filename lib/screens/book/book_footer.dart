import 'package:client/models/bookModel/book.dart';
import 'package:flutter/material.dart';
import 'text_feature_list.dart';
import 'book_borrow.dart';
import 'book_edit_button.dart';
import 'package:client/globals.dart' as global;

class HorizontalDivider extends SizedBox {
  const HorizontalDivider({super.key}) : super(height: 9);
}

class BookFooter extends StatelessWidget {
  final Book book;

  const BookFooter({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            global.isLibrarian(global.currentUser)
                ? BookEditButton(book: book)
                : BookBorrow(book: book),
            const VerticalDivider(
              thickness: 1,
              width: 25,
              color: Colors.black,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextFeatureList("Category", book.category),
                    const HorizontalDivider(),
                    TextFeatureList("Cover type", book.coverType),
                    const HorizontalDivider(),
                    TextFeatureList("Issue number", book.issueNumber),
                    const HorizontalDivider(),
                    TextFeatureList("Published", book.publishedDate),
                    const HorizontalDivider(),
                    TextFeatureList("ISBN", book.ISBN),
                    const HorizontalDivider(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
