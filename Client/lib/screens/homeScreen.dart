import 'package:client/screens/accountScreen.dart';
import 'package:client/screens/loginScreen.dart';
import 'package:client/screens/searchScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../menuItems/gridItem.dart';
import 'addScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.menu_book_outlined,
            ),
          ),
          title: const Text("Szacun Rispekt"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only( top: 25, bottom: 30, left: kIsWeb ? MediaQuery.of(context).size.width / 5 : MediaQuery.of(context).size.width / 20, right: kIsWeb ? MediaQuery.of(context).size.width / 5 : MediaQuery.of(context).size.width / 20 ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
                  children: [
                    GridItem(name:  "Wypożycz", image: "library1.jpg", onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const BookCreator() ))),),
                    GridItem(name:  "Przeglądaj", image: "library2.jpg", onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const SearchScreen(search: '', category: 'All', sort: 'Default',) ))), ),
                    GridItem(name:  "Biblioteki", image: "library3.jpg", onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginScreen() ))), ),
                    GridItem(name:  "Twoje konto", image: "library4.jpg", onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const AccountScreen())))),
                  ]
              ),
            ),
          ),
        )
    );
  }
}