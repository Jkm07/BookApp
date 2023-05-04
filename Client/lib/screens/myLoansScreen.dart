import 'package:client/globals.dart';
import 'package:client/lists/loanElementList.dart';
import 'package:flutter/material.dart';

class MyLoansScreen extends StatelessWidget {
  const MyLoansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: paddingGlobal,
        child: const LoanElementList(),
      ),
    );
  }
}
