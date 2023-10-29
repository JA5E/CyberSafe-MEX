import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  final List<Question> questions = [
    Question(
      text: 'What is the capital of France?',
      answers: ['Paris', 'London', 'Berlin', 'Madrid'],
      correctAnswer: 'Paris',
    ),
    Question(
      text: 'What is 2 + 2?',
      answers: ['1', '3', '4', '5'],
      correctAnswer: '4',
    ),
    Question(
      text: 'Which planet is known as the Red Planet?',
      answers: ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      correctAnswer: 'Mars',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: QuizScreen(questions: questions),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final String correctAnswer;

  Question({required this.text, required this.answers, required this.correctAnswer});
}

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  QuizScreen({required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<String> userAnswers = [];

  void selectAnswer(String selectedAnswer) {
    setState(() {
      userAnswers.add(selectedAnswer);
      if (currentQuestionIndex < widget.questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[currentQuestionIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'Question ${currentQuestionIndex + 1}: ${currentQuestion.text}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 10),
        Column(
          children: currentQuestion.answers.map((answer) {
            return ElevatedButton(
              onPressed: () {
                selectAnswer(answer);
              },
              child: Text(answer),
            );
          }).toList(),
        ),
        if (currentQuestionIndex < widget.questions.length - 1)
          ElevatedButton(
            onPressed: () {
              selectAnswer(''); // Skip question by selecting an empty answer
            },
            child: Text('Skip'),
          ),
        if (currentQuestionIndex == widget.questions.length - 1)
          ElevatedButton(
            onPressed: () {
              // Display the user's answers or calculate the score
              print('User Answers: $userAnswers');
            },
            child: Text('Submit'),
          ),
      ],
    );
  }
}
