import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('lib/media/${widget.urlVideo}'))
      ..initialize().then((_) {
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
      appBar: AppBar(
          title: Text(widget.title), backgroundColor: const Color(0xFF4548E6)),
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
              },
              child: const Text('Tomar Quiz'),
            ),
            // Add more widgets here
          ],
        )
      ]),
    );
  }
}
