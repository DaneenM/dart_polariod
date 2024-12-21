import 'package:flutter/material.dart';
import '../screens/fullscreen_viewer.dart';

class Polaroid extends StatefulWidget {
  final String mediaPath;
  final double rotation;
  final bool isVideo; // Specify if the media is a video

  const Polaroid(
      {required this.mediaPath,
      this.rotation = 0.0,
      this.isVideo = false,
      Key? key})
      : super(key: key);

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
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FullscreenViewer(
                mediaPath: widget.mediaPath,
                isVideo: widget.isVideo,
              ),
            ),
          );
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Shadow for the Polaroid frame
              Container(
                width: 210,
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      spreadRadius: 3,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
              ),
              // Polaroid frame with tape
              Image.asset(
                'assets/images/polaroid_tape3.png',
                width: 200,
                fit: BoxFit.contain,
              ),
              // Photo inside the Polaroid
              Positioned(
                top: 30, // Adjust position to align photo correctly
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.mediaPath,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120,
                        height: 120,
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            'Photo Missing',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
