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
    return Transform.rotate(
      angle: widget.rotation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Polaroid frame
            Image.asset(
              'assets/images/january.png', // Polaroid frame with tape
              width: 200,
              height: 240,
              fit: BoxFit.contain,
            ),
            // Media content (video) positioned precisely inside the frame
            Positioned(
              top: 56, // Adjusted to fit inside the Polaroid frame
              left: 45, // Align with the left edge of the inner frame
              right:
                  45, // Align with the right edge of the inner frame, go smaller to make wider
              bottom:
                  75, // Leave space for the Polaroid's bottom section, go higher to make smaller
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: widget.isVideo
                    ? VideoPlayerWidget(videoPath: widget.mediaPath)
                    : SizedBox(), // Fallback to empty if no video
              ),
            ),
          ],
        ),
      ),
    );
  }
}
