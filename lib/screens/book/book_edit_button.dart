import 'package:client/models/bookModel/book.dart';
import 'package:client/globals.dart' as global;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BookEditButton extends StatefulWidget {
  final Book book;

  const BookEditButton({Key? key, required this.book}) : super(key: key);

  @override
  State<BookEditButton> createState() => _BookEditButtonState();
}

class _BookEditButtonState extends State<BookEditButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: FutureBuilder(
          future:
              global.libraryDatabase.getUserLibrary(global.currentUser.userID),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Listener(
                onPointerUp: (_) => setState(() {
                  isPressed = false;
                }),
                onPointerDown: (_) => setState(() {
                  isPressed = true;
                }),
                child: Neumorphic(
                  margin: const EdgeInsets.only(left: 20),
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      depth: isPressed ? -5 : 20,
                      lightSource: LightSource.topLeft,
                      color: Theme.of(context).colorScheme.background),
                  child: ListTile(
                    iconColor: Theme.of(context).colorScheme.primary,
                    title: Text(
                      snapshot.data!.name,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    subtitle: Text(
                        "Quantity: ${snapshot.data!.booksAndQuantity[widget.book.bookID]}",
                        style: const TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic)),
                    trailing: const Icon(
                      Icons.home_filled,
                      size: 20,
                    ),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
