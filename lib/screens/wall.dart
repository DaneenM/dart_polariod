import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:polaroid_project/components/polaroid.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final String videoPath;

  const FullScreenVideoPlayer({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen Video'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}

class WallScreen extends StatelessWidget {
  const WallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/images/background.png'), // Background image
            fit: BoxFit.cover, // Ensures the image covers the entire screen
          ),
        ),
        child: Stack(
          children: [
            // Title at the top of the screen (image title)
            Positioned(
              top: 40, // Adjusted to make room for the title
              left: 50,
              child: Image.asset(
                'assets/images/home_title.png', // The title image
                width:
                    350, // Adjust the width of the title to make it fit better
              ),
            ),
            // First row of frames (video in first frame goes full screen on tap)
            Positioned(
              left: 25, // Moved more to the left for centering
              top: 120, // Moved down a bit for spacing
              child: GestureDetector(
                onTap: () {
                  // This is where the full-screen functionality will trigger
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenVideoPlayer(
                        videoPath: 'assets/videos/january.mp4', // January video
                      ),
                    ),
                  );
                },
                child: Polaroid(
                  mediaPath: 'assets/videos/january.mp4', // January video
                  isVideo: true,
                  rotation: -0.05,
                  size: 105, // Adjusted size for larger frame
                ),
              ),
            ),
            Positioned(
              left: 155, // Moved more to the left for centering
              top: 120, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/february_placeholder.png', // Placeholder for February
                isVideo: false,
                rotation: 0.02,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            Positioned(
              left: 285, // Moved more to the left for centering
              top: 120, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/march_placeholder.png', // Placeholder for March
                isVideo: false,
                rotation: -0.03,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            // Second row of frames
            Positioned(
              left: 25, // Moved more to the left for centering
              top: 235, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/april_placeholder.png', // Placeholder for April
                isVideo: false,
                rotation: 0.04,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            Positioned(
              left: 155, // Moved more to the left for centering
              top: 235, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/may_placeholder.png', // Placeholder for May
                isVideo: false,
                rotation: -0.02,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            Positioned(
              left: 285, // Moved more to the left for centering
              top: 235, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/june_placeholder.png', // Placeholder for June
                isVideo: false,
                rotation: 0.03,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            // Third row of frames
            Positioned(
              left: 25, // Moved more to the left for centering
              top: 350, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/july_placeholder.png', // Placeholder for July
                isVideo: false,
                rotation: -0.01,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            Positioned(
              left: 155, // Moved more to the left for centering
              top: 350, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/august_placeholder.png', // Placeholder for August
                isVideo: false,
                rotation: 0.05,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            Positioned(
              left: 285, // Moved more to the left for centering
              top: 350, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/september_placeholder.png', // Placeholder for September
                isVideo: false,
                rotation: 0.01,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            // Fourth row of frames
            Positioned(
              left: 25, // Moved more to the left for centering
              top: 465, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/october_placeholder.png', // Placeholder for October
                isVideo: false,
                rotation: -0.04,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            Positioned(
              left: 155, // Moved more to the left for centering
              top: 465, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/november_placeholder.png', // Placeholder for November
                isVideo: false,
                rotation: 0.01,
                size: 105, // Adjusted size for larger frame
              ),
            ),
            // Fifth row of frames (single frame)
            Positioned(
              left: 25, // Moved more to the left for centering
              top: 580, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath:
                    'assets/images/december_placeholder.png', // Placeholder for December
                isVideo: false,
                rotation: 0.03,
                size: 105, // Adjusted size for larger frame
              ),
            ),
          ],
        ),
      ),
    );
  }
}
