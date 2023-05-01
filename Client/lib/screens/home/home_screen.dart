import 'package:client/screens/accountScreen.dart';
import 'package:client/screens/home/main_background.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:client/screens/searchScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../addScreen.dart';
import 'package:client/globals.dart' as global;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Widget currentScreen = BookCreator();

  void _navigationBarChange(int index) {
    switch (index) {
      case 0:
        return global.setScreen(BookCreator());
      case 1:
        return global.setScreen(const SearchScreen());
      case 2:
        return global.setScreen(const LoginScreen());
      case 3:
        return global.setScreen(const AccountScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    global.setScreen = (Widget screen) => setState(() {
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
          title: const Text("Szacun Rispekt"),
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
                GButton(icon: Icons.menu_book, text: "Wypożycz"),
                GButton(icon: Icons.search, text: "Przeglądaj"),
                GButton(icon: Icons.other_houses, text: "Biblioteki"),
                GButton(icon: Icons.person, text: "Ustawienia"),
              ]),
        ),
        body: MainBackground(child: currentScreen));
  }
}
