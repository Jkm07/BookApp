import 'package:client/models/bookModel/book.dart';
import 'package:client/globals.dart' as global;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../models/libraryModel/library.dart';

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
        child: StreamProvider<Library?>.value(
          initialData: null,
          value: global.libraryDatabase
              .getUserLibraryStream(global.currentUser.userID),
          builder: (context, snapshot) {
            Library? library = Provider.of<Library?>(context);
            if (library != null) {
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
                      library.name,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    subtitle: Text(
                        "Quantity: ${library.booksAndQuantity[widget.book.bookID] ?? "0"}",
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
