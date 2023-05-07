import 'package:client/models/userModel/userLibrary.dart';
import 'package:client/screens/accountScreen/accountScreen.dart';
import 'package:client/screens/addScreen.dart';
import 'package:client/screens/historyLoan/loan_history_librarian.dart';
import 'package:client/screens/historyLoan/loan_history_user.dart';
import 'package:client/screens/home/main_background.dart';
import 'package:client/screens/myLoansScreen.dart';
import 'package:client/screens/searchScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:client/globals.dart' as global;

class MyHomePage extends StatefulWidget {
  final UserLibrary user;

  const MyHomePage({super.key, required this.user});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool isLibrarian = false;
  Widget currentScreen = const LoanHistoryUser();
  String title = "";

  void _navigationBarChangeUser(int index) {
    switch (index) {
      case 0:
        return global.setScreen(const LoanHistoryUser(), title: "My Loans");
      case 1:
        return global.setScreen(const MyLoansScreen(), title: "Wish list");
      case 2:
        return global.setScreen(const SearchScreen(), title: "Search book");
      case 3:
        return global.setScreen(const AccountScreen(), title: "Settings");
    }
  }

  void _navigationBarChangeLibrarian(int index) {
    switch (index) {
      case 0:
        return global.setScreen(const LoanHistoryLibrarian(),
            title: "Library loans");
      case 1:
        return global.setScreen(BookCreator(), title: "Add book");
      case 2:
        return global.setScreen(const SearchScreen(), title: "Search book");
      case 3:
        return global.setScreen(const AccountScreen(), title: "Settings");
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
    global.setScreen = (Widget screen, {String? title}) => setState(() {
          this.title = title ?? this.title;
          currentScreen = screen;
        });
    isLibrarian = global.isLibrarian(widget.user);
    currentScreen =
        isLibrarian ? const LoanHistoryLibrarian() : const LoanHistoryUser();
    title = isLibrarian ? "Library loans" : "My Loans";
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
          title: Text(title),
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
                  ? _navigationBarChangeLibrarian
                  : _navigationBarChangeUser,
              gap: 9,
              tabs: isLibrarian ? _buttonsLibrarian() : _buttonsUser()),
        ),
        body: MainBackground(child: currentScreen));
  }
}
