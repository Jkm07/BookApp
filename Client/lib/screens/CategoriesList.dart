import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../authorModel/author.dart';
import 'package:client/globals.dart' as globals;

class CategoriesList extends StatefulWidget {
  CategoriesList({Key? key, required this.selectedItem}) : super(key: key);

  String selectedItem;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {

  final items = ["None", "Categories", "Authors"];
  late double scaleHeight;
  late double scaleWidthApp;
  late double scaleWidthWeb;

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

  Widget returnAuthors(BuildContext context) {
    return FutureBuilder<List<Author>>(
        future: globals.authorsDatabase.getAllAuthors(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(itemCount: snapshot.data!.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index)
              {
                return space();
              },
              itemBuilder: (context, index)
              {
                return authorItemList(snapshot.data![index], context);
              }
              ,shrinkWrap: true,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget authorItemList(Author author, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        Navigator.pop(context, [widget.selectedItem, author.authorID])
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
              const Icon(Icons.person_outline_outlined),
              spaceWidth(10),
              Text(author.authorName, textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }

  Widget returnCategories(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: globals.booksDatabase.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(itemCount: snapshot.data!.length,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index)
              {
                return space();
              },
              itemBuilder: (context, index)
              {
                return categoryItemList(snapshot.data![index], context);
              }
              ,shrinkWrap: true,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget categoryItemList(String text, BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        Navigator.pop(context, [widget.selectedItem, text])
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
                  padding: const EdgeInsets.all(5),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    iconSize: 35,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    value: widget.selectedItem,
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Center(child: FittedBox(child: Text(item, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),))),
                    ))
                        .toList(),
                    onChanged: (item) => setState(() {
                      widget.selectedItem = item!;
                      if( item == "None" ) Navigator.pop(context, [item, item]);
                    }),
                  ),
                ),
                space(),
                if( widget.selectedItem == "Categories" )...[
                  returnCategories(context),
                ]
                else if( widget.selectedItem == "Authors" )...[
                  returnAuthors(context),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}