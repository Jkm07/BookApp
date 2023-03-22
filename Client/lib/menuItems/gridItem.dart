import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: Material(
        color: Colors.black12,
        elevation: 8,
        borderRadius: BorderRadius.circular(28),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            InkWell(
              onTap: () {},
                splashColor: Colors.white24,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.blue, width: 3)
                ),
                child: Ink.image(image: AssetImage("assets/image/${widget.image}"),
                    height: 300,
                    width: 500,
                    fit: BoxFit.cover,
            ),
              )
            ),
            Text(
                widget.name,
                style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}