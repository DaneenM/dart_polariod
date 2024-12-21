import 'package:flutter/material.dart';
import '../components/polaroid.dart';

class WallScreen extends StatelessWidget {
  const WallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFe0d4c1), // A light beige color for a painted wall
        child: Stack(
          children: [
            Positioned(
              left: 50,
              top: 100,
              child: Polaroid(
                mediaPath: 'assets/images/sample_photo.png',
                rotation: -0.05,
              ),
            ),
            Positioned(
              right: 70,
              top: 200,
              child: Polaroid(
                mediaPath: 'assets/videos/january.mp4',
                rotation: 0.05,
                isVideo: true, // Specify this is a video
              ),
            ),
            Positioned(
              left: 100,
              bottom: 150,
              child: Polaroid(
                mediaPath: 'assets/images/sample_photo.png',
                rotation: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
