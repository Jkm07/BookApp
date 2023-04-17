import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../universalBooksList.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, this.search, this.category, this.sort}) : super(key: key);

  final String? search;
  final String? category;
  final String? sort;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;

  Widget space( [double? value] ){
    return SizedBox(
      height: value == null ? scaleHeight : value,
    );
  }

  @override
  Widget build(BuildContext context) {
    scaleHeight = MediaQuery.of(context).size.height * 0.02;
    scaleWidthWeb = MediaQuery.of(context).size.width / 5;
    scaleWidthApp = MediaQuery.of(context).size.width / 20;

    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
          ),
        ),
        title: Text( "Books", style: TextStyle( fontSize: 20 ), ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB( kIsWeb ? scaleWidthWeb : scaleWidthApp, MediaQuery.of(context).size.height * 0.05, kIsWeb ? scaleWidthWeb : scaleWidthApp, MediaQuery.of(context).size.height * 0.05),
        child: Column(
          children: [
            Row(
              children: [

              ],
            ),
            space(),
            Row(
              children: [

              ],
            ),
            space(),
            Expanded(
              child: Container(
                child: UniversalBooksList(
                  category: widget.category,
                  search: widget.search,
                  sort: widget.sort,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}