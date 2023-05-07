import 'package:client/globals.dart';
import 'package:client/lists/librariesList.dart';
import 'package:flutter/material.dart';
import '../menuItems/filterSortRow.dart';
import '../menuItems/searchBar.dart';

class LibrariesScreen extends StatefulWidget {
  LibrariesScreen({Key? key, required this.search, required this.sort, required this.filter}) : super(key: key);

  String search;
  String sort;
  String filter;

  @override
  State<LibrariesScreen> createState() => _LibrariesScreenState();
}

class _LibrariesScreenState extends State<LibrariesScreen> {

  late TextEditingController controller;
  List<String> filterList = ["All"];
  List<String> sortList = ["Default", "Name: alphabetically"];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.home_filled,
        ),
        title: const Text(
          "Libraries",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: paddingGlobal,
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
                filter: widget.filter,
                sort: widget.sort,
                filterList: filterList,
                sortList: sortList,
                filterIcon: Icons.person_outline_outlined,
                sortIcon: Icons.abc_outlined,
                filterOnTap: (String value) {
                  setState(() {
                    widget.filter = value;
                  });
                },
                sortOnTap: (String value) {
                  widget.sort = value;
                }),
            space(),
            LibrariesList(search: widget.search, sort: widget.sort, filter: widget.filter),
          ],
        ),
      ),
    );
  }
}