import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interface_number_3/models/models.dart';

class QuizApp extends StatefulWidget {
  final String quizSession;

  const QuizApp({Key? key, required this.quizSession}) : super(key: key);
  @override
  QuizAppState createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {
  List<Question> quizQuestions = [];
  int? selectedValue;
  Map<int, int> selectedAnswers = {};

  @override
  void initState() {
    loadQuizDataFromJson(widget.quizSession);
    super.initState();
  }

  Future<void> loadQuizDataFromJson(String? session) async {
    try {
      final String jsonData = await rootBundle.loadString('lib/quizzes.json');
      final List<dynamic> jsonDataList = json.decode(jsonData);
      print(jsonDataList);
      // Find the matching session
      var matchingSessionData = jsonDataList.firstWhere(
        (sessionData) => sessionData['session'] == session,
        orElse: () => null, // Return null if no matching session is found
      );

      if (matchingSessionData != null) {
        final List<dynamic> questionsData = matchingSessionData['questions'];
        quizQuestions = questionsData.map((questionData) {
          final String question = questionData['question'];
          final List<String> options =
              List<String>.from(questionData['options']);
          final dynamic correctAnswer = questionData['correctAnswer'];
          return Question(question, options, correctAnswer);
        }).toList();
      } else {
        print(widget.quizSession);
        print('Quiz session not found');
      }
    } catch (error) {
      print('Error al cargar el JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        /*
        if (_controller.value.isInitialized)
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  _controller.seekTo(Duration.zero);
                });
              },
            ),
          ],
        ),
        */
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF4548E6),
                minimumSize: const Size(0, 60),
              ),
              onPressed: () {
                // Add your button's onPressed logic here
                Navigator.pushNamed(context, 'quiz',
                    arguments: {'quizSession': widget.quizSession});
              },
              child: const Text('Tomar Quiz'),
            ),
            // Add more widgets here
          ],
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              ...quizQuestions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: buildQuestionWidget(question, index)
                );
              }).toList(),
            ],
          ),
        )
      ]),
    );
  }














Widget buildQuestionWidget(Question question, int index) {
  return Card(
    margin: EdgeInsets.all(8.0),
    child: Column(
      children: [
        ListTile(
          title: Text(question.question),
        ),
        Column(
          children: question.options.asMap().entries.map((entry) {
            int optionIndex = entry.key;
            String option = entry.value;
            bool isSelected = false;

            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.blue : Colors.grey,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Radio<int>(
                      value: optionIndex,
                      groupValue: null,
                      onChanged: (value) {
                        // Handle radio button changes if needed.
                      },
                    ),
                    Text(option),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    ),
  );
}


}




class ValueList {
  Map<String, dynamic> _map = {};

  void addValue(String key, dynamic value) {
    _map[key] = value;
  }

  Map<String, dynamic> get values {
    return _map;
  }
}




/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interface_number_3/models/models.dart';

class QuizApp extends StatefulWidget {
  final String quizSession;

  QuizApp(this.quizSession);
  @override
  QuizAppState createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {
  List<Question> quizQuestions = [];

  @override
  void initState() {
    loadQuizDataFromJson(widget.quizSession);
    super.initState();
  }

  Future<void> loadQuizDataFromJson(String quizSession) async {
    try {
      final String jsonData =
          await rootBundle.loadString('lib/data/quizzes.json');
      final List<dynamic> jsonDataList = json.decode(jsonData);

      // Assuming that the JSON data is a list of quiz sessions, iterate through them
      for (var sessionData in jsonDataList) {
        if (sessionData['session'] == quizSession) {
          final List<dynamic> questionsData = sessionData['questions'];
          quizQuestions = questionsData.map((questionData) {
            final String question = questionData['question'];
            final List<String> options =
                List<String>.from(questionData['options']);
            final dynamic correctAnswer = questionData['correctAnswer'];
            return Question(question, options, correctAnswer);
          }).toList();
        }
      }
      print(quizQuestions);
    } catch (error) {
      print('Error al cargar el JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizSession), // Use widget.quizSession to access the session name
      ),
      body: ListView.builder(
        itemCount:
            quizQuestions.length, // Use quizQuestions instead of quizSession
        itemBuilder: (context, index) {
          final question = quizQuestions[index];
          return Column(
            children: [
              Text(
                'Question ${index + 1}: ${question.question}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Column(
                children: question.options.asMap().entries.map((entry) {
                  final int optionIndex = entry.key;
                  final String option = entry.value;
                  return ListTile(
                    title: Text(option),
                    leading: Radio(
                      value: optionIndex,
                      groupValue: null, // You need to handle this value
                      onChanged: (value) {
                        // Handle the selected option
                      },
                    ),
                  );
                }).toList(),
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
*/

/*import 'package:flutter/material.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Quiz!',
              style: TextStyle(fontSize: 24),
            ),
            // Add your quiz UI components here
          ],
        ),
      ),
    );
  }
}
*/