// Step 1: Import Flutter's Cupertino package containing Apple (iOS-style) components and themes
import 'package:flutter/cupertino.dart';

// Step 2: The main entry point function where execution of the Dart application starts
void main() {
  // Step 3: Tell Flutter to start drawing the root widget onto the device screen
  runApp(
    // Step 4: CupertinoApp serves as the root widget for iOS-style design, animations, and typography
    const CupertinoApp(
      // Step 5: Define the primary home screen layout using the iOS page container
      home: CupertinoPageScaffold(
        // Step 6: Define the main content area of the iOS page scaffold
        child: Center(
          // Step 7: Center widget aligns its child directly in the middle of the screen space
          child: Text(
            // Step 8: Text widget renders the given string on screen using iOS typography styles
            'Hello, CupertinoApp!',
          ),
        ),
      ),
    ),
  );
}
