import 'package:flutter/material.dart';

class StateContainer extends StatelessWidget {
  const StateContainer({super.key, required this.state, required this.textColor, required this.highlightColor});
  final String state;
  final Color textColor;
  final Color highlightColor;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: highlightColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(state, style: TextStyle(color: textColor)),
      ),
    );
  }
}
