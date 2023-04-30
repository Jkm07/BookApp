import 'package:client/globals.dart';
import 'package:flutter/material.dart';

Widget reusableContainer(String name, Function() onTap, Color color){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: scaleHeight * 2.5,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          name,
        ),
      ),
    ),
  );
}