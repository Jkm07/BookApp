import 'package:client/authorModel/author.dart';
import 'package:client/screens/CategoriesList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../universalBooksList.dart';
import 'package:client/globals.dart' as globals;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.search, required this.category, required this.sort}) : super(key: key);

  final String? search;
  final String? category;
  final String? sort;

  @override
  State<SearchScreen> createState() => _SearchScreenState(category ?? "All", search ?? "", sort ?? "Default");
}

class _SearchScreenState extends State<SearchScreen> {
  _SearchScreenState(this.value, this.search, this.sort);

  dynamic value;
  String search;
  String sort;

  //Dropdown button
  String selectedItem = "None";

  List<String> sortList = ["Default", "Title: alphabetically"];
  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;
  TextEditingController searchController = TextEditingController();

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

  Widget returnSorts(BuildContext context){
    return ListView.separated(itemCount: sortList.length,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index)
      {
        return space();
      },
      itemBuilder: (context, index)
      {
        return CategoryItemList(sortList[index], context);
      }
      ,shrinkWrap: true,
    );
  }

  Widget CategoryItemList(String text, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        Navigator.pop(context, text)
      },
      child: Container(
        alignment: Alignment.center,
        height: scaleHeight * 3,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu_book_outlined),
              spaceWidth(10),
              Text(text, textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    scaleHeight = MediaQuery.of(context).size.height * 0.02;
    scaleWidthWeb = MediaQuery.of(context).size.width / 5;
    scaleWidthApp = MediaQuery.of(context).size.width / 20;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
          ),
        ),
        title: Text( "Books", style: TextStyle( fontSize: 20 ), ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB( kIsWeb ? scaleWidthWeb : scaleWidthApp, MediaQuery.of(context).size.height * 0.05, kIsWeb ? scaleWidthWeb : scaleWidthApp, MediaQuery.of(context).size.height * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      suffixIcon: searchController.text.length > 0 ? GestureDetector(child: Icon(Icons.highlight_remove_outlined), onTap: null,) : null,
                      hintText: "Search something...",
                      labelText: "Search",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide( width: 2 ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide( width: 4 ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            space(scaleHeight),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final result = await
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return CategoriesList(selectedItem: selectedItem,);
                          }
                      );
                      if ( result != null )
                      {
                        setState(() {
                          selectedItem = result[0];
                          value = result[1];
                        });
                      }
                    },
                    child: Container(
                      height: scaleHeight * 3,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          isCollapsed: true,
                          labelStyle: TextStyle(fontSize: 18),
                          labelText: "Filter by",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(child:FittedBox(child: Text( ( selectedItem == "None" ? selectedItem : selectedItem + ": " + value is Author ? value.authorName : value ), style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18),)) ),
                      ),
                    ),
                  ),
                ),
                spaceWidth(scaleHeight),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      final result = await
                      showDialog(context: context,
                          builder: (BuildContext context){
                            return Center(
                              child: Material(

                                type: MaterialType.transparency,
                                child: Container(
                                  width: kIsWeb ? scaleWidthWeb * 2 : double.infinity,
                                  height: kIsWeb ? scaleHeight * 25 : scaleHeight * 17,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.all(scaleHeight),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(5)),
                                          ),
                                          height: scaleHeight * 3,
                                          child: Center(
                                            child: FittedBox(
                                              child: Text(
                                                "Sort",
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                        space(),
                                        returnSorts(context),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                      );
                      if ( result != null )
                      {
                        setState(() {
                          sort = result;
                        });
                      }
                    },
                    child: Container(
                      height: scaleHeight * 3,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          isCollapsed: true,
                          labelStyle: TextStyle(fontSize: 18),
                          labelText: "Sort by",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(child: FittedBox(child: Text(sort, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18 ),)) ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            space( kIsWeb ? scaleHeight * 3 : scaleHeight * 2),
            UniversalBooksList(
              filterType: selectedItem,
              value: value,
              search: search,
              sort: sort,
            ),
          ],
        ),
      ),
    );
  }
}