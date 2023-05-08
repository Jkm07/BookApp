import 'package:client/screens/accountScreen/textButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tuple/tuple.dart';

import '../../globals.dart';

Widget adminList(BuildContext context) {
  return Column(
    children: [
      textIconButton(
        context,
        "Manage users",
        Icons.person_outline_outlined,
        () => context.go("/user/list/Default/All/view",
            extra: const Tuple2(null, null)),
      ),
      space(),
      textIconButton(
        context,
        "Manage libraries",
        Icons.holiday_village_outlined,
        () => context.go("/library"),
      ),
      space(),
      textIconButton(
        context,
        "Add library",
        Icons.home_filled,
        () => context.go("/library/add"),
      ),
      space(),
    ],
  );
}
