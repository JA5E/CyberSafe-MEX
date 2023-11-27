import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:interface_number_3/models/news.dart';
import 'package:interface_number_3/widgets/newsCard_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';
import '../widgets/button_widget.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  CoursesScreenState createState() => CoursesScreenState();
}

class CoursesScreenState extends State<CoursesScreen> {
  List<ButtonData> buttonData = [];

  @override
  void initState() {
    loadButtonDataFromJson();
    super.initState();
  }

  Future<List<News>> jsonNews = getNews();

  static Future<List<News>> getNews() async {
    const url =
        "https://newsapi.org/v2/everything?q=Cybersecurity&language=es&apiKey=22ec77bb32294fe19bc6116439061998";
    final response = await http.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    return (body['articles'] as List<dynamic>)
        .map<News>((item) => News.fromJson(item))
        .toList();
  }

  Future<void> loadButtonDataFromJson() async {
    try {
      final String jsonData = await rootBundle.loadString('lib/data.json');
      final List<dynamic> jsonDataList = jsonDecode(jsonData);
      final data = jsonDataList.map((item) {
        return ButtonData(item['text'], item['action']);
      }).toList();
      setState(() {
        buttonData = data;
      });
    } catch (error) {
      print('Error al cargar el JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF4548E6),
            title: const Text('CyberSafe MX'),
          ),
          body: TabBarView(
            children: [
              // Primer tab
              SingleChildScrollView(
                child: Column(
                  children: buttonData.map((data) {
                    return Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: MyButtonBuilder.buildElevatedButton(data.text, () {
                        // Realiza la acción correspondiente (data.action)
                        Map<String, dynamic> args = {
                          'videoUrl': data.action,
                          'title': data.text,
                        };
                        Navigator.pushNamed(context, 'video', arguments: args);
                      }),
                    );
                  }).toList(),
                ),
              ),
              // Otros tabs
              Column(
                children: [
                  NewsListView(
                    newsListFuture: jsonNews,
                  ),
                ],
              ),
              const Icon(Icons.feedback),
              const Icon(Icons.account_box),
            ],
          ),
          bottomNavigationBar: Container(
            color: const Color(0xFF4548E6),
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.smart_display)),
                Tab(icon: Icon(Icons.newspaper)),
                Tab(icon: Icon(Icons.feedback)),
                Tab(icon: Icon(Icons.account_box)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
