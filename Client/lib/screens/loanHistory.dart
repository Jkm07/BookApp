import 'package:client/globals.dart';
import 'package:client/lists/loanHistoryList.dart';
import 'package:flutter/material.dart';

class LoanHistory extends StatefulWidget {
  LoanHistory({Key? key, required this.screenType}) : super(key: key);

  String screenType;

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
        title: const Text("Loans History"),
      ),
      body: SingleChildScrollView(
        padding: paddingGlobal,
        child: Column(
          children: [
            LoanHistoryList(screenType: widget.screenType),
          ],
        ),
      ),
    );
  }
}
