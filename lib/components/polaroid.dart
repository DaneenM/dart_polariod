import 'package:flutter/material.dart';
import 'package:polaroid_project/components/video_player_widget.dart';

class Polaroid extends StatefulWidget {
  final String mediaPath;
  final bool isVideo;
  final double rotation;
  final double size; // Added size parameter for dynamic resizing

  const Polaroid({
    required this.mediaPath,
    this.isVideo = false,
    this.rotation = 0.0,
    this.size = 70, // Default size
    Key? key,
  }) : super(key: key);

  @override
  _PolaroidState createState() => _PolaroidState();
}

class _PolaroidState extends State<Polaroid>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Heartbeat effect

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isVideo) {
          setState(() {
            isPlaying = !isPlaying;
          });
        }
      },
      child: Transform.rotate(
        angle: widget.rotation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Media content (video or image) positioned inside the frame
              Positioned(
                top: 34,
                left: 29,
                right: 23,
                bottom: 40,
                child: widget.mediaPath.isEmpty
                    ? Center(
                        child: Text(
                          'No Media Assigned',
                          style: TextStyle(color: Colors.white),
                        ),
                      ) // Show message if no media
                    : widget.isVideo
                        ? VideoPlayerWidget(
                            videoPath: widget.mediaPath,
                            autoplay: isPlaying,
                          )
                        : Container(
                            width: widget.size, // Set the image size
                            height: widget.size * 1.2, // Adjust image height
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.mediaPath),
                                fit: BoxFit.cover,
                              ),
                              // No borderRadius here to maintain pointy edges
                            ),
                          ),
              ),
              // Polaroid frame above the media content
              IgnorePointer(
                child: Image.asset(
                  'assets/images/january.png', // The static frame image
                  width: widget.size, // Set dynamic frame size
                  height:
                      widget.size * 1.2, // Adjust frame height for aesthetics
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
