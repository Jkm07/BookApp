import 'package:client/globals.dart';
import 'package:flutter/material.dart';

class LoanHistory extends StatefulWidget {
  const LoanHistory({Key? key}) : super(key: key);

  @override
  State<LoanHistory> createState() => _LoanHistoryState();
}

class _LoanHistoryState extends State<LoanHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.bookmark_add_outlined,
        ),
        title: const Text("Loan History"),
      ),
      body: SingleChildScrollView(
        padding: paddingGlobal,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
