import 'package:flutter/material.dart';
import 'package:polaroid_project/components/polaroid.dart';

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
            // Title image centered at the top
            Positioned(
              top: 40, // Adjusted to make room for the title
              left: MediaQuery.of(context).size.width *
                  0.25, // Centered horizontally
              child: Image.asset(
                'assets/images/home.png', // Title image path
                width: MediaQuery.of(context).size.width *
                    0.5, // Adjust width as needed
                height: 100, // Adjust height as needed
              ),
            ),
            // First row of frames
            Positioned(
              left: 25, // Moved more to the left for centering
              top: 120, // Moved down a bit for spacing
              child: Polaroid(
                mediaPath: 'assets/videos/january.mp4', // January video
                isVideo: true,
                rotation: -0.05,
                size: 105, // Adjusted size for larger frame
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
