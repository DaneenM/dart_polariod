import 'package:flutter/material.dart';
import 'screens/wall.dart';

void main() {
  runApp(PolaroidApp());
}

class PolaroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Polaroid Wall',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: WallScreen(),
    );
  }
}
