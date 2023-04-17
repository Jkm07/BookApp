import 'package:client/screens/addScreen.dart';
import 'package:client/screens/searchScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'menuItems/gridItem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: kIsWeb ? null : "library-project-97373",
    options: const FirebaseOptions(
        apiKey: "AIzaSyBsMlTJMI9c505jjnVqOsLKV-35ZjiV6f8",
        projectId: "library-project-97373",
        messagingSenderId: "244193587125",
        appId: "1:244193587125:web:46bd1ca818bfac498033fc",
        storageBucket: "library-project-97373.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff6b1a0a),
      ),
      debugShowCheckedModeBanner: false,
      title: 'BookAPP',
      home: MyHomePage(title: 'BookAPP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6b1a0a),
      appBar: AppBar(
        backgroundColor: const Color(0xff471005),
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu_book_outlined,
          ),
        ),
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only( top: 25, bottom: 30, left: kIsWeb ? MediaQuery.of(context).size.width / 7 : MediaQuery.of(context).size.width / 20, right: kIsWeb ? MediaQuery.of(context).size.width / 7 : MediaQuery.of(context).size.width / 20 ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
                children: [
                  GridItem(name:  "Wypożycz", image: "library1.jpg", onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const BookCreator() ))),),
                  GridItem(name:  "Przeglądaj", image: "library2.jpg", onTap: () => Navigator.push(context, MaterialPageRoute(builder: ((context) => const SearchScreen() ))), ),
                  GridItem(name:  "Biblioteki", image: "library3.jpg" ),
                  const GridItem(name:  "Twoje konto", image: "library4.jpg"),
                ]
            ),
          ),
        ),
      )
    );
  }
}