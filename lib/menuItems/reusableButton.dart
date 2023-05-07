import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "../globals.dart";

Widget reusableButton(BuildContext context, String title, Function() onTap){
    return Container(
      width: kIsWeb ? scaleWidthWeb : double.infinity,
      height: scaleHeight * 2,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Theme.of(context).colorScheme.error;
              }
              return Theme.of(context).colorScheme.primary;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
        child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
}