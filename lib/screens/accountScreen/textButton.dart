import 'package:flutter/material.dart';

import '../../globals.dart';

Widget textIconButton(
    BuildContext context, String text, IconData icon, Function() onTap) {
  return Container(
    width: double.infinity,
    height: scaleHeight * 2.5,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
    child: ElevatedButton.icon(
      icon: Icon(icon),
      onPressed: onTap,
      label: SizedBox(
        child: Text(
          text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.background,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.error;
            }
            return Theme.of(context).colorScheme.secondary;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}