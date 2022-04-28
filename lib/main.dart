import 'package:flutter/material.dart';
import './quiz.dart';
import 'resultQuiz.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _selectQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'Qual a sua cor Favorita?',
      'answers': [
        {'label': 'Preto', 'score': 4},
        {'label': 'Branco', 'score': 5},
        {'label': 'Vermelho', 'score': 7},
        {'label': 'Verde', 'score': 5}
      ]
    },
    {
      'question': 'Qual o seu instrumento favorito?',
      'answers': [
        {'label': 'Guitarra', 'score': 10},
        {'label': 'Contra-baixo', 'score': 8},
        {'label': 'Bateria', 'score': 7},
        {'label': 'Teclado', 'score': 3}
      ]
    },
    {
      'question': 'Qual a sua banda favorita?',
      'answers': [
        {'label': 'Led Zeppelin', 'score': 10},
        {'label': 'Black Sabbath', 'score': 9},
        {'label': 'Deep Purple', 'score': 7},
        {'label': 'Kiss', 'score': 8}
      ],
    },
  ];

  void _reply(int score) {
    if (isQuestionSelected) {
      setState(() {
        _selectQuestion++;
        _totalScore += score;
      });
      print(_totalScore.toString());
    }
  }

  void _resetQuiz() {
    setState(() {
      _selectQuestion = 0;
      _totalScore = 0;
    });
  }

  bool get isQuestionSelected {
    return _selectQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Quizz')),
        ),
        body: isQuestionSelected
            ? Quiz(
                questions: _questions,
                selectQuestion: _selectQuestion,
                onAnswer: _reply)
            : ResultQuiz(_totalScore, _resetQuiz),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
