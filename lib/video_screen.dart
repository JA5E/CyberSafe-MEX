
/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswer;

  QuizQuestion(this.question, this.options, this.correctAnswer);
}

class VideoDemo extends StatefulWidget {
  VideoDemo() : super();

  final String title = "Video Demo";

  @override
  VideoDemoState createState() => VideoDemoState();
}

class VideoDemoState extends State<VideoDemo> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final quizQuestions = [
    QuizQuestion(
      "What is Flutter?",
      ["A mobile development framework", "A music band", "A type of bird"],
      0,
    ),
    QuizQuestion(
      "Which programming language is used in Flutter?",
      ["Dart", "Java", "Python"],
      0,
    ),
  ];

  @override
  void initState() {
    _controller = VideoPlayerController.asset("lib/media/1.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
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
        title: Text("Video Demo"),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          Expanded(
            child: QuizScreen(quizQuestions),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  final List<QuizQuestion> questions;

  QuizScreen(this.questions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
*/


/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

 
class VideoDemo extends StatefulWidget {
  VideoDemo() : super();
 
  final String title = "Video Demo";
 
  @override
  VideoDemoState createState() => VideoDemoState();
}
 
class VideoDemoState extends State<VideoDemo> {
  //
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
 
  @override
  void initState() {
    ///_controller = VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    _controller = VideoPlayerController.asset("lib/media/1.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
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
        title: Text("Video Demo"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
*/