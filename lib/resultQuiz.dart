import 'package:flutter/material.dart';

class ResultQuiz extends StatelessWidget {
  final int score;
  final void Function() onResetQuiz;

  ResultQuiz(this.score, this.onResetQuiz);

  String get statusResult {
    if (score < 8) {
      return 'Parabéns';
    } else if (score < 12) {
      return 'Aí sim';
    } else if (score < 16) {
      return 'Impressionante';
    } else {
      return 'Metal God!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            statusResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: ElevatedButton(
              onPressed: onResetQuiz,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent)),
              child: Text(
                'Reiniciar',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              )),
        ),
      ],
    );
  }
}
