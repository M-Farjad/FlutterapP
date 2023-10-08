import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VideoCaptionScreen(),
    );
  }
}

class VideoCaptionScreen extends StatefulWidget {
  const VideoCaptionScreen({super.key});

  @override
  State<VideoCaptionScreen> createState() => _VideoCaptionScreenState();
}

class _VideoCaptionScreenState extends State<VideoCaptionScreen> {
  VideoPlayerController? _controller;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      _controller = VideoPlayerController.file(File(pickedFile.path))
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Caption App'),
      ),
      body: Center(
        child: _controller != null
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : ElevatedButton(
                onPressed: _pickVideo,
                child: const Text('Pick a Video'),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
