import 'package:flutter/material.dart';
import 'menuItems/gridItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookAPP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.dark()
      ),
      home: const MyHomePage(title: 'BookAPP'),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 11,
            mainAxisSpacing: 11,
            children: const [
              GridItem(name:  "Wyporzycz", image: "library1.jpg"),
              GridItem(name:  "Przegladaj", image: "library2.jpg"),
              GridItem(name:  "Biblioteki", image: "library3.jpg"),
              GridItem(name:  "Twoje konto", image: "library4.jpg")]
        ),
      )
    );
  }
}
