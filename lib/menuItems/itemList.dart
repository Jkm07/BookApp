import 'package:flutter/material.dart';
import '../globals.dart';

Widget itemList(BuildContext context, String text, IconData icon, Function onTap,  ) {
  return GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () {
      Navigator.pop(context, text);
      onTap(text);
    },
    child: Container(
      alignment: Alignment.center,
      height: scaleHeight * 3,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            spaceWidth(10),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}