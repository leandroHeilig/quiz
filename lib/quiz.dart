import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectQuestion;
  final void Function(int) onAnswer;

  Quiz({
    required this.questions,
    required this.selectQuestion,
    required this.onAnswer,
  });

  bool get isQuestionSelected {
    return selectQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers =
        isQuestionSelected ? questions[selectQuestion].cast()['answers'] : [];

    return Column(children: <Widget>[
      Question(questions[selectQuestion]['question'].toString()),
      ...answers.map((answer) {
        return Answer(answer['label'].toString(),
            () => onAnswer(int.parse(answer['score'].toString())));
      }).toList(),
    ]);
  }
}
