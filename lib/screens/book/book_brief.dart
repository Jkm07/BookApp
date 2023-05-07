import 'package:flutter/material.dart';

class BookBrief extends StatelessWidget {
  final String _pages;
  final String _language;
  final String _release;

  Widget gridElement(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
              fontSize: 17,
              color: Theme.of(context).colorScheme.secondary,
            )),
        Text(label,
            style: TextStyle(
              fontSize: 17,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary,
            ))
      ],
    );
  }

  const BookBrief(this._pages, this._language, this._release, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gridElement(context, _pages, "Pages"),
            const VerticalDivider(
              thickness: 1,
              width: 40,
              color: Colors.black,
            ),
            gridElement(context, _language, "Language"),
            const VerticalDivider(
              thickness: 1,
              width: 40,
              color: Colors.black,
            ),
            gridElement(context, _release, "Release"),
          ],
        ),
      ),
    );
  }
}
