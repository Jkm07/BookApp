import 'package:client/menuItems/showDialog.dart';
import 'package:flutter/material.dart';
import '../globals.dart';
import '../lists/universalList.dart';

class FilterSortRow extends StatefulWidget {
  FilterSortRow(
      {Key? key,
      required this.filterType,
      required this.filter,
      required this.sort,
      required this.filterList,
      required this.sortList,
      required this.filterIcon,
      required this.sortIcon,
      required this.filterOnTap,
      required this.sortOnTap})
      : super(key: key);

  String filterType;
  String filter;
  String sort;
  List<String> filterList;
  List<String> sortList;
  IconData filterIcon;
  IconData sortIcon;
  Function filterOnTap;
  Function sortOnTap;

  @override
  State<FilterSortRow> createState() => _FilterSortRowState();
}

class _FilterSortRowState extends State<FilterSortRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: scaleHeight * 3,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final result = await ShowDialog(
                  context,
                  widget.filterType,
                  returnList(context, widget.filterList, widget.filterIcon,
                      widget.filterOnTap),
                );
                if (result != null) {
                  setState(() {
                    widget.filter = result;
                    //widget.filterOnTap(result);
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
                  child: Center(
                      child: FittedBox(
                          child: Text(
                    widget.filter,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ))),
                ),
              ),
            ),
          ),
          spaceWidth(scaleHeight),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final result = await ShowDialog(
                    context,
                    "Sort",
                    returnList(context, widget.sortList, widget.sortIcon,
                        widget.sortOnTap));
                setState(() {
                  if (result != null) {
                    setState(() {
                      widget.sort = result;
                      //widget.filterOnTap(result);
                    });
                  }
                });
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
                  child: Center(
                      child: FittedBox(
                          child: Text(
                    widget.sort,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
