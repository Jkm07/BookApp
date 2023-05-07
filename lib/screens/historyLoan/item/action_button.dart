import 'package:client/screens/historyLoan/data/loan_monad.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final LoanMonad loanMonad;
  final void Function(LoanMonad)? action;
  final String label;
  final Color color;

  const ActionButton(this.loanMonad, this.action, this.label, this.color,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: action != null ? () => action!(loanMonad) : null,
      child: Ink(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 35.0, minHeight: 8.0),
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    );
  }
}
