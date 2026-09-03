// Step 1: Import Flutter's Material Design package containing Android-style components and themes
import 'package:flutter/material.dart';

// Step 2: The main entry point function where execution of the Dart application starts
void main() {
  // Step 3: Tell Flutter to start drawing the root widget onto the device screen
  runApp(
    // Step 4: MaterialApp serves as the root widget for Material Design styling, routing, and themes
    const MaterialApp(
      // Step 5: Define the primary home screen layout using the Scaffold widget
      home: Scaffold(
        // Step 6: Define the main body area of the screen
        body: Center(
          // Step 7: Center widget aligns its child directly in the middle of the screen
          child: Text(
            // Step 8: Text widget renders the given string on screen with Material defaults
            'Hello, MaterialApp!',
          ),
        ),
      ),
    ),
  );
}
