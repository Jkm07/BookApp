import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../globals.dart';
import '../../models/userModel/userLibrary.dart';

Widget returnUserInfo(UserLibrary user) {
  return AspectRatio(
    aspectRatio: kIsWeb ? 5 : 3 / 1,
    child: Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(scaleHeight),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Image.asset(
              user.userType == "user"
                  ? "assets/image/reader.png"
                  : "assets/image/librarian.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(scaleHeight),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    "Username: ${user.userName}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                space(),
                FittedBox(
                  child: Text(
                    "Email: ${user.userMail}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                space(),
                FittedBox(
                  child: Text(
                    "Account type: ${user.userType}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}