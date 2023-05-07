import 'package:flutter/material.dart';
import 'package:client/globals.dart' as globals;

class SearchBar extends StatefulWidget {
  SearchBar({Key? key, required this.controller, required this.callback}) : super(key: key);

  TextEditingController controller;
  Function callback;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: globals.scaleHeight * 3,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              enableSuggestions: true,
              autocorrect: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.controller.text = "";
                    });
                  },
                  child: Container(
                    child: Icon(
                      Icons.highlight_remove_outlined,
                    ),
                  ),
                ),
                hintText: "Search something...",
                labelText: "Search",
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 4),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.callback(widget.controller.text);
            },
            child: Container(
              height: globals.scaleHeight * 3,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              padding: const EdgeInsets.all(5),
              child: Center(
                child: const Text(
                  "Search", style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}