import 'package:flutter/material.dart';
import 'package:interface_number_3/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'courses',
      routes: {
        'courses': (_) => const CoursesScreen(),
        'video': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final String videoUrl = args['videoUrl'];
          final String title = args['title'];
          return YoutubeScreen(urlVideo: videoUrl, title: title);
        },
        'quiz': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          final String quizSession = args['quizSession'];
          return QuizApp(quizSession: quizSession);
        },
      },
    );
  }
}
