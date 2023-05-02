import 'package:client/globals.dart';
import 'package:client/menuItems/loanElement.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoanElementList extends StatefulWidget {
  const LoanElementList({Key? key}) : super(key: key);

  @override
  State<LoanElementList> createState() => _LoanElementListState();
}

class _LoanElementListState extends State<LoanElementList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loansDatabase.getAllUserLoans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (context, index) {
                return space();
              },
              itemBuilder: (context, index) {
                return LoanListElement(
                  loanElement: snapshot.data![index],
                  callBack: () {
                    setState(() {});
                  },
                );
              },
              shrinkWrap: true,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}