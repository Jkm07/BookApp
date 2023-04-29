import 'package:client/authorModel/author.dart';
import 'package:client/screens/CategoriesList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../universalBooksList.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key, required this.search, required this.category, required this.sort}) : super(key: key);

  final String? search;
  final String? category;
  final String? sort;

  @override
  State<SearchScreen> createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> {

  @override
  void initState() {
    super.initState();
    value = widget.category ?? value;
    search = widget.search ?? search;
    sort = widget.sort ?? sort;
  }

  dynamic value = "All";
  String search = "";
  String sort = "Default";

  //Dropdown button
  String selectedItem = "None";

  List<String> sortList = ["Default", "Title: alphabetically"];
  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;
  TextEditingController searchController = TextEditingController();

  Widget space( [double? value] ){
    return SizedBox(
      height: value ?? scaleHeight,
    );
  }

  Widget spaceWidth( double value ){
    return SizedBox(
      width: value,
    );
  }

  Widget returnSorts(BuildContext context){
    return ListView.separated(itemCount: sortList.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index)
      {
        return space();
      },
      itemBuilder: (context, index)
      {
        return categoryItemList(sortList[index], context);
      }
      ,shrinkWrap: true,
    );
  }

  Widget categoryItemList(String text, BuildContext context) {
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
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.menu_book_outlined),
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
          child: const Icon(
            Icons.search,
          ),
        ),
        title: const Text( "Books", style: TextStyle( fontSize: 20 ), ),
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
                      prefixIcon: const Icon(Icons.search_outlined),
                      suffixIcon: searchController.text.isNotEmpty ? GestureDetector(onTap: null,child: const Icon(Icons.highlight_remove_outlined),) : null,
                      hintText: "Search something...",
                      labelText: "Search",
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide( width: 2 ),
                      ),
                      focusedBorder: const OutlineInputBorder(
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
                    child: SizedBox(
                      height: scaleHeight * 3,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          isCollapsed: true,
                          labelStyle: const TextStyle(fontSize: 18),
                          labelText: "Filter by",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(child:FittedBox(child: Text( ( selectedItem == "None" ? selectedItem : "$selectedItem: " + value is Author ? value.authorName : value ), style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 18),)) ),
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
                                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                                          ),
                                          height: scaleHeight * 3,
                                          child: const Center(
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
                    child: SizedBox(
                      height: scaleHeight * 3,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          filled: true,
                          isCollapsed: true,
                          labelStyle: const TextStyle(fontSize: 18),
                          labelText: "Sort by",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Center(child: FittedBox(child: Text(sort, style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 18 ),)) ),
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