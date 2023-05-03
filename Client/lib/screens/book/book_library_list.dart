import 'package:flutter/material.dart';
import 'package:selectable_list/selectable_list.dart';

class _Library {
  String name;
  String subtitle;
  int quantity;

  _Library(this.name, this.subtitle, this.quantity);
}

class LibraryList extends StatefulWidget {
  const LibraryList(this.chooseLibrary,{super.key});

  final void Function() chooseLibrary;

  @override
  State<LibraryList> createState() => _LibraryList();
}

class _LibraryList extends State<LibraryList> {
  final libraries = [
    _Library("Library_1", "Biblioteka_1", 1),
    _Library("Library_2", "Biblioteka_2", 2),
    _Library("Library_3", "Biblioteka_3", 3)
  ];

  String? selectedName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14.0, top: 8.0),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black))
      ),
      child: SizedBox(
        height: 70,
        child: SelectableList<_Library, String?>(
          items: libraries,
          itemBuilder: (context, library, selected, onTap) => ListTile(
              title: Text(library.name, style: const TextStyle(fontSize: 12)),
              subtitle: Text("Books: ${library.quantity.toString()}",
                  style: const TextStyle(fontSize: 10)),
              selected: selected,
              trailing: const Icon(
                Icons.check,
                color: Colors.green,
                size: 22,
              ),
              onTap: onTap),
          valueSelector: (library) => library.name,
          selectedValue: selectedName,
          onItemSelected: (person) => widget.chooseLibrary(),
          onItemDeselected: (person) => widget.chooseLibrary(),
        ),
      ),
    );
  }
}
