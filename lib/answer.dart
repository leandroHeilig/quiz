import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String label;
  final void Function() onSelect;

  Answer(this.label, this.onSelect);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      margin: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onSelect,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
