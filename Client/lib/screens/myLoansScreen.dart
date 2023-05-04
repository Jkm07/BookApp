import 'package:client/globals.dart';
import 'package:client/lists/loanElementList.dart';
import 'package:flutter/material.dart';

class MyLoansScreen extends StatefulWidget {
  const MyLoansScreen({Key? key}) : super(key: key);

  @override
  State<MyLoansScreen> createState() => _MyLoansScreenState();
}

class _MyLoansScreenState extends State<MyLoansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.list,
        ),
        title: const Text("My loans"),
      ),
      body: SingleChildScrollView(
        padding: paddingGlobal,
        child: Column(
          children: [
            LoanElementList(),
          ],
        ),
      ),
    );
  }
}