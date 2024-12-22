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
            // Row 1: 3 Frames
            Positioned(
              left: 20,
              top: 100,
              child: Polaroid(
                mediaPath: 'assets/videos/january.mp4', // January video
                isVideo: true,
                rotation: -0.05,
              ),
            ),
            Positioned(
              left: 120,
              top: 100,
              child: Polaroid(
                mediaPath:
                    'assets/images/february_placeholder.png', // Placeholder for February
                isVideo: false,
                rotation: 0.02,
              ),
            ),
            Positioned(
              left: 220,
              top: 100,
              child: Polaroid(
                mediaPath:
                    'assets/images/march_placeholder.png', // Placeholder for March
                isVideo: false,
                rotation: -0.03,
              ),
            ),
            // Row 2: 3 Frames
            Positioned(
              left: 20,
              top: 300,
              child: Polaroid(
                mediaPath:
                    'assets/images/april_placeholder.png', // Placeholder for April
                isVideo: false,
                rotation: 0.05,
              ),
            ),
            Positioned(
              left: 120,
              top: 300,
              child: Polaroid(
                mediaPath:
                    'assets/images/may_placeholder.png', // Placeholder for May
                isVideo: false,
                rotation: -0.02,
              ),
            ),
            Positioned(
              left: 220,
              top: 300,
              child: Polaroid(
                mediaPath:
                    'assets/images/june_placeholder.png', // Placeholder for June
                isVideo: false,
                rotation: 0.03,
              ),
            ),
            // Row 3: 3 Frames
            Positioned(
              left: 20,
              top: 500,
              child: Polaroid(
                mediaPath:
                    'assets/images/july_placeholder.png', // Placeholder for July
                isVideo: false,
                rotation: -0.01,
              ),
            ),
            Positioned(
              left: 120,
              top: 500,
              child: Polaroid(
                mediaPath:
                    'assets/images/august_placeholder.png', // Placeholder for August
                isVideo: false,
                rotation: 0.02,
              ),
            ),
            Positioned(
              left: 220,
              top: 500,
              child: Polaroid(
                mediaPath:
                    'assets/images/september_placeholder.png', // Placeholder for September
                isVideo: false,
                rotation: -0.04,
              ),
            ),
            // Row 4: 2 Frames
            Positioned(
              left: 70,
              top: 700,
              child: Polaroid(
                mediaPath:
                    'assets/images/october_placeholder.png', // Placeholder for October
                isVideo: false,
                rotation: 0.01,
              ),
            ),
            Positioned(
              left: 170,
              top: 700,
              child: Polaroid(
                mediaPath:
                    'assets/images/november_placeholder.png', // Placeholder for November
                isVideo: false,
                rotation: -0.02,
              ),
            ),
            // Row 5: 1 Frame
            Positioned(
              left: 120,
              top: 900,
              child: Polaroid(
                mediaPath:
                    'assets/images/december_placeholder.png', // Placeholder for December
                isVideo: false,
                rotation: 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
