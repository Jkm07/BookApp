import 'package:client/screens/accountScreen/accountScreen.dart';
import 'package:client/screens/home/main_background.dart';
import 'package:client/screens/historyLoan/loan_history_user.dart';
import 'package:client/screens/myLoansScreen.dart';
import 'package:client/screens/searchScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:client/globals.dart' as global;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Widget currentScreen = const MyLoansScreen();
  String title = "Wish list";

  void _navigationBarChange(int index) {
    switch (index) {
      case 0:
        return global.setScreen(const MyLoansScreen(), title: "Wish list");
      case 1:
        return global.setScreen(const SearchScreen(), title: "Search book");
      case 2:
        return global.setScreen(const LoanHistoryUser(), title: "Loans");
      case 3:
        return global.setScreen(const AccountScreen(), title: "Settings");
    }
  }

  @override
  void initState() {
    super.initState();
    global.setScreen = (Widget screen, {String? title}) => setState(() {
          this.title = title ?? this.title;
          currentScreen = screen;
        });
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
              onTabChange: _navigationBarChange,
              gap: 9,
              tabs: const [
                GButton(icon: Icons.list_alt, text: "Wish list"),
                GButton(icon: Icons.search, text: "Search"),
                GButton(icon: Icons.my_library_books, text: "Loans"),
                GButton(icon: Icons.person, text: "Settings"),
              ]),
        ),
        body: MainBackground(child: currentScreen));
  }
}
