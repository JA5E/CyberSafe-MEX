import 'dart:math';

import 'package:flutter/material.dart';
import 'package:interface_number_3/widgets/newsCard_widget.dart';

class News {
  final String author;
  final String title;
  final String description;
  final String imageUrl;

  News({
    required this.author,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    try {
      return News(
        author: json['author'] ?? 'Unknown Author',
        title: json['title'] ?? 'Untitled',
        description: json['description'] ?? 'No description available',
        imageUrl: json['urlToImage'] ?? 'https://example.com/default-image.jpg',
      );
    } catch (e) {
      // Handle any exceptions that may occur during parsing
      print('Error parsing JSON: $e');
      return News(
        author: 'Error Author',
        title: 'Error Title',
        description: 'Error Description',
        imageUrl: 'https://example.com/error-image.jpg',
      );
    }
  }
}

class NewsListView extends StatelessWidget {
  final Future<List<News>> newsListFuture;

  NewsListView({required this.newsListFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: newsListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading news'));
        } else {
          List<News> newsList = snapshot.data ?? [];
          // Limit the number of news items to 10

          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int index = 0; index < newsList.length; index++)
                      CardWidget(
                        author: newsList[index].author,
                        title: newsList[index].title,
                        description: newsList[index].description,
                        imageUrl: newsList[index].imageUrl,
                      ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
