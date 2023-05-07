import 'package:client/models/userModel/userLibrary.dart';
import 'package:flutter/material.dart';

class LoanUserHeader extends StatelessWidget {
  final UserLibrary user;

  const LoanUserHeader(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: ListTile(
        leading: Icon(
          Icons.person,
          color: Theme.of(context).colorScheme.primary,
          size: 40,
        ),
        title: Text(
          user.userName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        subtitle: Text(
          user.userMail,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
