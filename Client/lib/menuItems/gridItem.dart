import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  const GridItem({super.key, required this.name, required this.image, this.onTap});

  final String name;
  final String image;
  final Function()? onTap;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: InkWell(
              onTap: widget.onTap,
              splashColor: Colors.white60,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/image/${widget.image}"),
                      fit: BoxFit.cover
                  ),
                ),
              ),
            ),
        ),
        Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.black,
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
        ),
      ],
    );
  }
}