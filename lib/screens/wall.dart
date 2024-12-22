import 'package:flutter/material.dart';
import '../components/polaroid.dart';

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
            Positioned(
              left: 50,
              top: 100,
              child: Polaroid(
                mediaPath: 'assets/videos/january.mp4', // January video
                isVideo: true,
                rotation: -0.05,
              ),
            ),
            Positioned(
              left: 180,
              top: 300,
              child: Polaroid(
                mediaPath:
                    'assets/images/february_placeholder.png', // Placeholder for February
                isVideo: false,
                rotation: 0.02,
              ),
            ),
            Positioned(
              left: 100,
              top: 500,
              child: Polaroid(
                mediaPath:
                    'assets/images/march_placeholder.png', // Placeholder for March
                isVideo: false,
                rotation: -0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
