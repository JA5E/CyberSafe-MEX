import 'package:flutter/material.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuizQuestion(this.question, this.options, this.correctAnswer);
}
class QuizScreen extends StatelessWidget {
  final List<QuizQuestion> questions;

  QuizScreen(this.questions);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(questions[index].question),
              Column(
                children: questions[index].options.map((option) {
                  return RadioListTile<int>(
                    title: Text(option),
                    value: questions[index].options.indexOf(option),
                    groupValue: -1,
                    onChanged: (value) {
                      // Handle user's selection
                      if (value == questions[index].correctAnswer) {
                        // User selected the correct answer
                      } else {
                        // User selected the wrong answer
                      }
                    },
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
