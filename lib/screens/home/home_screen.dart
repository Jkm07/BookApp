import 'package:client/screens/home/main_background.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:client/globals.dart' as global;

class MyHomePage extends StatefulWidget {
  final Widget child;
  final String title;

  const MyHomePage({super.key, required this.child, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool isLibrarian = false;

  void _navigationBarChangeUser(BuildContext context, int index) {
    switch (index) {
      case 0:
        return context.go("/loans/history/user");
      case 1:
        return context.go("/wishList");
      case 2:
        return context.go("/book/search");
      case 3:
        return context.go("/settings");
    }
  }

  void _navigationBarChangeLibrarian(BuildContext context, int index) {
    switch (index) {
      case 0:
        return context.go("/loans/history/librarian");
      case 1:
        return context.go("/book/create");
      case 2:
        return context.go("/book/search");
      case 3:
        return context.go("/settings");
    }
  }

  List<GButton> _buttonsUser() {
    return [
      const GButton(icon: Icons.my_library_books, text: "My loans"),
      const GButton(icon: Icons.list_alt, text: "Wish list"),
      const GButton(icon: Icons.search, text: "Search"),
      const GButton(icon: Icons.person, text: "Settings")
    ];
  }

  List<GButton> _buttonsLibrarian() {
    return [
      const GButton(icon: Icons.my_library_books, text: "Library loans"),
      const GButton(icon: Icons.menu_book_sharp, text: "Add book"),
      const GButton(icon: Icons.search, text: "Search"),
      const GButton(icon: Icons.person, text: "Settings")
    ];
  }

  @override
  void initState() {
    super.initState();

    isLibrarian = global.isLibrarian(global.currentUser);
  }

  @override
  Widget build(BuildContext context) {
    final paddingHorizontal =
        kIsWeb ? MediaQuery.of(context).size.width / 5 : 0.0;

    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(
              Icons.menu_book_outlined,
            ),
          ),
          title: Text(widget.title),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.secondary,
          padding:
              EdgeInsets.symmetric(vertical: 0, horizontal: paddingHorizontal),
          child: GNav(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              color: Theme.of(context).colorScheme.background,
              activeColor: Theme.of(context).colorScheme.primary,
              onTabChange: isLibrarian
                  ? (index) => _navigationBarChangeLibrarian(context, index)
                  : (index) => _navigationBarChangeUser(context, index),
              gap: 9,
              tabs: isLibrarian ? _buttonsLibrarian() : _buttonsUser()),
        ),
        body: MainBackground(child: widget.child));
  }
}
