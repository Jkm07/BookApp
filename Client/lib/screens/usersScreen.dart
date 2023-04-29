import 'package:client/usersList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.search,
          ),
        ),
        title: const Text( "Users", style: TextStyle( fontSize: 20 ), ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only( top: globals.scaleHeight * 2 , bottom: globals.scaleHeight * 2, left: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp, right: kIsWeb ? globals.scaleWidthWeb : globals.scaleWidthApp ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            globals.space(),
            const UsersList(),
          ],
        ),
      ),
    );
  }
}
