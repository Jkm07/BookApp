import 'package:client/models/bookModel/book.dart';
import 'package:flutter/material.dart';
import 'text_feature_list.dart';

class HorizontalDivider extends SizedBox {
  const HorizontalDivider({super.key}) : super(height: 8);
}

class BookFooter extends StatelessWidget {
  final Book _book;

  const BookFooter(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ActionChip(
                  avatar: const Icon(
                    Icons.menu_book_outlined,
                  ),
                  label: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Borrow"),
                  ),
                  labelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  onPressed: () {}),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 25,
              color: Colors.black,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    TextFeatureList("Category", _book.category),
                    const HorizontalDivider(),
                    TextFeatureList("Cover type", _book.coverType),
                    const HorizontalDivider(),
                    TextFeatureList("Issue number", _book.issueNumber),
                    const HorizontalDivider(),
                    TextFeatureList("Quantity", _book.quantity),
                    const HorizontalDivider(),
                    TextFeatureList("ISBN", _book.ISBN),
                    const HorizontalDivider(),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
