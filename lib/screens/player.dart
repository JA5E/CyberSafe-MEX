import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../models/models.dart';

class YoutubeScreen extends StatefulWidget {

  final String url_video; // Corrected variable name
  const YoutubeScreen({Key? key, required this.url_video}) : super(key: key);

  @override
  _YoutubeScreenState createState() => _YoutubeScreenState();
}

class _YoutubeScreenState extends State<YoutubeScreen> {

  late VideoPlayerController _controller;





  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse('lib/media/${widget.url_video}')
    )
      ..initialize()
      .then((_) {
        setState(() {});
      });

    // Start playing the video automatically (optional)
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
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
                icon: Icon(Icons.replay),
                onPressed: () {
                  setState(() {
                    _controller.seekTo(Duration.zero);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}