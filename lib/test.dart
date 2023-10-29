import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JsonReaderApp(),
    );
  }
}

class JsonReaderApp extends StatefulWidget {
  @override
  _JsonReaderAppState createState() => _JsonReaderAppState();
}

class _JsonReaderAppState extends State<JsonReaderApp> {
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String jsonData = await rootBundle.loadString('lib/data.json');

      final List<dynamic> jsonDataList = json.decode(jsonData);

      print('JSON Data:');
      for (var item in jsonDataList) {
        print('ID: ${item['id']}, Name: ${item['name']}');
      }
    } catch (error) {
      print('Error al cargar el JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Reader App'),
      ),
      body: Center(
        child: Text('Verifica la consola para ver los datos del JSON.'),
      ),
    );
  }
}
