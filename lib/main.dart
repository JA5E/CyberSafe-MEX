import 'package:flutter/material.dart';
import 'package:interface_number_3/screens/screens.dart';
import 'package:interface_number_3/video_screen.dart';
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
          'courses': (_) => MyApp(),
          'video': (_) => TabBarDemo(),
          'quiz': (_) => TabBarDemo(),


        }
      
    );
  }
}
