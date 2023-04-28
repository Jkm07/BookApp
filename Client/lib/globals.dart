import 'package:client/authorsDatabase.dart';
import 'package:client/loansDatabase.dart';
import 'package:client/publishersDatabase.dart';
import 'package:client/userDatabase.dart';
import 'package:flutter/material.dart';
import 'booksDatabase.dart';

BooksDatabase booksDatabase = BooksDatabase();
UserDatabase userDatabase = UserDatabase();
LoansDatabase loansDatabase = LoansDatabase();
PublisherDatabase publisherDatabase = PublisherDatabase();
AuthorsDatabase authorsDatabase = AuthorsDatabase();
final pixelRatio = MediaQueryData.fromWindow(WidgetsBinding.instance.window).devicePixelRatio;
final scaleHeight = WidgetsBinding.instance.window.physicalSize.height / pixelRatio * 0.02;
final scaleWidthWeb = WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 5;
final scaleWidthApp =  WidgetsBinding.instance.window.physicalSize.width / pixelRatio / 20;

Widget space( [double? value] ){
  return SizedBox(
    height: value == null ? scaleHeight : value,
  );
}

Widget spaceWidth( double value ){
  return SizedBox(
    width: value,
  );
}
