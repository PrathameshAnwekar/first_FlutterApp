// ignore_for_file: avoid_print, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  var questions = const [
    {
      'questionText': 'Whats your favorite colour?',
      'answers': [
        {'text': 'Black', 'score': 50},
        {'text': 'Red', 'score': 10},
        {'text': 'White', 'score': 15},
        {'text': 'Green', 'score': 40}
      ]
    },
    {
      'questionText': 'Whats your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text':'Snake', 'score':20},
        {'text':'Giraffe', 'score':30},
        {'text':'Racoon', 'score':40}
      ]
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    _totalScore += score;
    print('Answer chosen!');
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }
  void _resetQuiz(){
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
    });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('My First App')),
          body: _questionIndex < questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: questions)
              : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}
