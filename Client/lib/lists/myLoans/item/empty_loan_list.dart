import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/src/foundation/constants.dart';

class EmptyLoanList extends StatelessWidget {
  const EmptyLoanList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your borrow list is empty',
          style: TextStyle(
              fontSize: 30,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        if (!kIsWeb)
          Lottie.network(
            "https://assets5.lottiefiles.com/packages/lf20_hl5n0bwb.json",
          )
      ],
    );
  }
}
