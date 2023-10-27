/*
import 'package:flutter/material.dart';
import 'package:interface_number_3/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Replace 'YOUR_VIDEO_ID' with the actual YouTube video ID

    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video Player'),
      ),
      body: const Center(
        child: 
        YoutubeScreen(url_video: 'https://www.youtube.com/watch?v=n1Y4HROvFME')
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoTuto extends StatefulWidget {
  final String videoUrl;

  const VideoTuto({super.key, required this.videoUrl});

  @override
  // ignore: library_private_types_in_public_api
  _VideoTutoState createState() => _VideoTutoState();
}

class _VideoTutoState extends State<VideoTuto> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.videoUrl as Uri)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Pantalla'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(), // Muestra un indicador de carga mientras se inicializa el video
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

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
*/
