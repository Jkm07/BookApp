import 'package:client/globals.dart';
import 'package:client/lists/loanElementList.dart';
import 'package:flutter/material.dart';

class MyLoansScreen extends StatelessWidget {
  const MyLoansScreen({Key? key}) : super(key: key);

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
        child: const LoanElementList(),
      ),
    );
  }
}
