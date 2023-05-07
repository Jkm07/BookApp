import 'package:client/models/libraryModel/library.dart';
import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

class LibraryList extends StatefulWidget {
  final void Function(Library?) chooseLibrary;
  final List<Library> libraries;

  const LibraryList(this.libraries, this.chooseLibrary, {super.key});

  @override
  State<LibraryList> createState() => _LibraryList();
}

class _LibraryList extends State<LibraryList> {
  String? selectedLibrary;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14.0, top: 8.0),
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black))),
      child: SizedBox(
        height: 70,
        child: SelectableList<Library, String?>(
          items: widget.libraries,
          itemBuilder: (context, library, selected, onTap) => ListTile(
              title: Text(library.name, style: const TextStyle(fontSize: 12)),
              subtitle: Text("Books: ${library.address.toString()}",
                  style: const TextStyle(fontSize: 10)),
              selected: selected,
              trailing: const Icon(
                Icons.check,
                color: Colors.green,
                size: 22,
              ),
              onTap: onTap),
          valueSelector: (library) => library.libraryID,
          selectedValue: selectedLibrary,
          onItemSelected: (library) {
            setState(() => selectedLibrary = library.libraryID);
            widget.chooseLibrary(library);
          },
          onItemDeselected: (library) {
            setState(() => selectedLibrary = null);
            widget.chooseLibrary(null);
          },
        ),
      ),
    );
  }
}
