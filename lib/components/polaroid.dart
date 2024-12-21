import 'package:flutter/material.dart';
import 'package:polaroid_project/components/video_player_widget.dart';

class Polaroid extends StatefulWidget {
  final String mediaPath;
  final bool isVideo;
  final double rotation;

  const Polaroid({
    required this.mediaPath,
    this.isVideo = false,
    this.rotation = 0.0,
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
                top: 45,
                left: 37,
                right: 37,
                bottom: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: widget.isVideo
                      ? VideoPlayerWidget(
                          videoPath: widget.mediaPath,
                          autoplay: isPlaying,
                        )
                      : Image.asset(
                          widget.mediaPath,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              // Polaroid frame above the media content
              IgnorePointer(
                child: Image.asset(
                  'assets/images/january.png', // Frame remains static
                  width: 200,
                  height: 240,
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
