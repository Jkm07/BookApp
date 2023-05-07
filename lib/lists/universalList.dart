import 'package:client/menuItems/itemList.dart';
import 'package:flutter/material.dart';
import '../globals.dart';

Widget returnList(BuildContext context, List<String> list, IconData icon, Function onTap) {
  return ListView.separated(
    itemCount: list.length,
    physics: const NeverScrollableScrollPhysics(),
    separatorBuilder: (context, index) {
      return space();
    },
    itemBuilder: (context, index) {
      return itemList(context, list[index], icon, onTap);
    },
    shrinkWrap: true,
  );
}