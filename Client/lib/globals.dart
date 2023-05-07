import 'package:client/databases/authorsDatabase.dart';
import 'package:client/databases/librariesDatabase.dart';
import 'package:client/databases/loansDatabase.dart';
import 'package:client/databases/publishersDatabase.dart';
import 'package:client/databases/userDatabase.dart';
import 'package:client/models/userModel/userLibrary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'databases/booksDatabase.dart';

BooksDatabase booksDatabase = BooksDatabase();
UserDatabase userDatabase = UserDatabase();
LoansDatabase loansDatabase = LoansDatabase();
PublisherDatabase publisherDatabase = PublisherDatabase();
AuthorsDatabase authorsDatabase = AuthorsDatabase();
LibraryDatabase libraryDatabase = LibraryDatabase();

final pixelRatio =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).devicePixelRatio;
final scaleHeight =
    WidgetsBinding.instance.window.physicalSize.height / pixelRatio * 0.02;
final scaleWidthWeb =
    WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 5;
final scaleWidthApp =
    WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 20;

EdgeInsetsGeometry paddingGlobal = EdgeInsets.only(
    top: scaleHeight * 2,
    bottom: scaleHeight * 2,
    left: kIsWeb ? scaleWidthWeb : scaleWidthApp,
    right: kIsWeb ? scaleWidthWeb : scaleWidthApp);

Widget space([double? value]) {
  return SizedBox(
    height: value ?? scaleHeight,
  );
}

Widget spaceWidth(double value) {
  return SizedBox(
    width: value,
  );
}

void Function(Widget, {String? title}) setScreen =
    (Widget w, {String? title}) => {};

bool isAdmin(UserLibrary user) => user.userType == "admin";

bool isLibrarian(UserLibrary user) => user.userType == "librarian";

bool isUser(UserLibrary user) => user.userType == "user";
