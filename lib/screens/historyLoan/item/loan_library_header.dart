import 'package:client/models/libraryModel/library.dart';
import 'package:flutter/material.dart';

class LoanLibraryHeader extends StatelessWidget {

  final Library library;

  const LoanLibraryHeader(this.library, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ListTile(
        leading: Icon(
          Icons.menu_book_sharp,
          color: Theme.of(context).colorScheme.primary,
          size: 40,
        ),
        title: Text(
          library.name,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(
          library.address,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
