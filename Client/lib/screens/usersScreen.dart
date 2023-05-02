import 'package:client/lists/usersList.dart';
import 'package:client/menuItems/filterSortRow.dart';
import 'package:client/menuItems/searchBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../models/libraryModel/library.dart';

class UsersScreen extends StatefulWidget {
  UsersScreen(
      {Key? key,
      this.callBack,
      required this.search,
      required this.sort,
      required this.userType,
      required this.screenType,
        this.library,
      })
      : super(key: key);

  String search;
  String sort;
  String userType;
  String screenType;
  Function? callBack;
  Library? library;

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  late TextEditingController controller;

  late List<String> filterList;
  List<String> sortList = ["Default", "Username: alphabetically"];

  @override
  void initState() {
    super.initState();
    filterList = widget.screenType == "view" ? ["All", "user", "librarian"] : ["librarian"];
    controller = TextEditingController();

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print("Users screen");

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.search,
          ),
        ),
        title: const Text(
          "Users",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: scaleHeight * 2,
            bottom: scaleHeight * 2,
            left: kIsWeb ? scaleWidthWeb : scaleWidthApp,
            right: kIsWeb ? scaleWidthWeb : scaleWidthApp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchBar(
              controller: controller,
              callback: (String newSearch) {
                setState(() {
                  widget.search = newSearch;
                });
              },
            ),
            space(),
            FilterSortRow(
                filterType: "UserType",
                filter: widget.userType,
                sort: widget.sort,
                filterList: filterList,
                sortList: sortList,
                filterIcon: Icons.person_outline_outlined,
                sortIcon: Icons.abc_outlined,
                filterOnTap: (String value) {
                  setState(() {
                    widget.userType = value;
                  });
                },
                sortOnTap: (String value) {
                  setState(() {
                    widget.sort = value;
                  });
                }),
            space(),
            UsersList(
              search: widget.search,
              sort: widget.sort,
              userType: widget.userType,
              screenType: widget.screenType,
              callBack: widget.callBack,
              library: widget.library,
            ),
          ],
        ),
      ),
    );
  }
}