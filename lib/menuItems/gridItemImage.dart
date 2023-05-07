import 'dart:typed_data';
import 'package:flutter/material.dart';

class GridElement extends StatefulWidget {
  GridElement({super.key, required this.image, required this.index, this.onTap});

  final Uint8List image;
  final int index;
  Function? onTap;

  @override
  State<GridElement> createState() => _GridElementState();
}

class _GridElementState extends State<GridElement> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                  image: MemoryImage(widget.image), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
            onTap: () => widget.onTap!(widget.index),
            child: Container(
              color: Colors.black,
              child: Icon(
                Icons.remove_circle_outline, color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}