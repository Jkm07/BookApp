import 'package:client/globals.dart';
import 'package:client/models/libraryModel/library.dart';
import 'package:client/utils/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LibrariesList extends StatefulWidget {
  LibrariesList(
      {Key? key,
      required this.search,
      required this.sort,
      required this.filter})
      : super(key: key);

  String search;
  String sort;
  String filter;

  @override
  State<LibrariesList> createState() => _LibrariesListState();
}

class _LibrariesListState extends State<LibrariesList> {
  Widget libraryItemList(Library library) {
    return GestureDetector(
      onTap: () => context.go("/library/add", extra: library),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
          height: scaleHeight * 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  "assets/image/library.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              spaceWidth(kIsWeb ? scaleHeight * 3 : scaleHeight),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FittedBox(
                        child: Text(
                      library.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    )),
                    FittedBox(
                        child: Text(
                      library.address,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16),
                    )),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: libraryDatabase.getLibraries(
            widget.search, widget.sort, widget.filter),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return space();
              },
              itemBuilder: (context, index) {
                return libraryItemList(snapshot.data![index]);
              },
              shrinkWrap: true,
            );
          } else {
            return const Loading();
          }
        });
  }
}
