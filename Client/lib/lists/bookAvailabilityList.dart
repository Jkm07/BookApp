import 'package:flutter/material.dart';

import '../globals.dart';
import '../models/libraryModel/library.dart';

class BookAvailabilityList extends StatefulWidget {
  const BookAvailabilityList({Key? key, this.bookID}) : super(key: key);

  final bookID;

  @override
  State<BookAvailabilityList> createState() => _BookAvailabilityListState();
}

class _BookAvailabilityListState extends State<BookAvailabilityList> {

  late List<Library>? _libraryList;

  @override
  void initState(){
    getList();
  }

  Widget availabilityItemList(Library library) {
    return const Center(child: CircularProgressIndicator());
  }

  getList() async{
    setState(() {
      _libraryList = null;
    });

  }

  @override
  Widget build(BuildContext context) {

    if(_libraryList == null){
      return const Center(child: CircularProgressIndicator());
    }else{
      return ListView.separated(
        itemCount: _libraryList!.length,
        separatorBuilder: (context, index) {
          return space();
        },
        itemBuilder: (context, index) {
          return availabilityItemList(_libraryList![index]);
        },
        shrinkWrap: true,
      );
    }

  }

}