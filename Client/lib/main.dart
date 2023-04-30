import 'package:client/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
        textTheme: Typography.blackRedwoodCity,
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          errorColor: Colors.red,
          backgroundColor: Colors.white,
          accentColor: Colors.black,
          cardColor: Colors.lightGreen,
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'BookAPP',
      home: const LoginScreen(),
    );
  }
}
