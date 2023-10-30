import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interface_number_3/models/models.dart';
import 'package:interface_number_3/screens/quiz_screen.dart';
import 'package:video_player/video_player.dart';
import '../widgets/button_widget.dart';

class YoutubeScreen extends StatefulWidget {
  final String urlVideo; // Corrected variable name
  final String title;
  const YoutubeScreen({Key? key, required this.urlVideo, required this.title})
      : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {
  late VideoPlayerController _controller;
  List<Question> quizQuestions = [];
  Map<int, int> selectedAnswers = {};

  @override
  void initState() {

    loadQuizDataFromJson(widget.title);


    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('lib/media/${widget.urlVideo}'))
      ..initialize().then((_) {
        setState(() {});
      });

    // Start playing the video automatically (optional)
    _controller.play();
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
        print(widget.title);
        print('Quiz session not found');
      }
    } catch (error) {
      print('Error al cargar el JSON: $error');
    }
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title), backgroundColor: const Color(0xFF4548E6)
      ),
      body: ListView(children: [
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
        /*
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
                    arguments: {'quizSession': widget.title});
              },
              child: const Text('Tomar Quiz'),
            ),
            // Add more widgets here
          ],
        ),
        */
        SingleChildScrollView(
          child: Column(
            children: [
              ...quizQuestions.asMap().entries.map((entry) {
                final index = entry.key;
                final question = entry.value;
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: QuizAppState().buildQuestionWidget(question, index)
                );
              }).toList(),
            ],
          ),
        )
      ]),
    );
  }
}
