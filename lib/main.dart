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
          final args = ModalRoute.of(context)!.settings.arguments as String;
          return YoutubeScreen(url_video: args);
        },
        'quiz': (_) => MyApp(),
      },
    );
  }
}
