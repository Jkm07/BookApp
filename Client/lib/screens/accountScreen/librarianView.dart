import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';

Widget librarianList(BuildContext context) {
  return Column(
    children: [
      textIconButton(context, "Manage books", Icons.menu_book_outlined, () {}),
      space(),
    ],
  );
}
