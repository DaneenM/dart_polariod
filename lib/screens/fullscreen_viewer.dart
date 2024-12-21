import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullscreenViewer extends StatefulWidget {
  final String mediaPath;
  final bool isVideo;

  const FullscreenViewer(
      {required this.mediaPath, this.isVideo = false, Key? key})
      : super(key: key);

  @override
  _FullscreenViewerState createState() => _FullscreenViewerState();
}

class _FullscreenViewerState extends State<FullscreenViewer> {
  VideoPlayerController? _videoController;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      _videoController = VideoPlayerController.asset(widget.mediaPath)
        ..initialize().then((_) {
          setState(() {}); // Refresh when video is initialized
          _videoController?.play();
        });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: widget.isVideo
            ? (_videoController?.value.isInitialized ?? false
                ? AspectRatio(
                    aspectRatio: _videoController!.value.aspectRatio,
                    child: VideoPlayer(_videoController!),
                  )
                : CircularProgressIndicator(color: Colors.white))
            : Image.asset(
                widget.mediaPath,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
