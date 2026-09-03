// Step 1: Import Flutter's UI toolkit
import 'package:flutter/widgets.dart';

// Step 2: The starting gate of Dart
void main() {
  // Step 3: Tell Flutter to start drawing the app on the screen
  runApp(
    //Step 4: WidgetsApp/MaterialApp/CupertinoApp/custom named Class is used as the root widget of the application.
    WidgetsApp(
      // Step 5: Define the primary app accent color required by the OS task switcher for WidgetsApp
      color: Color(0xFFFFFFFF),
      // Step 6: Use the builder function callback to define the visual layout rendered on screen
      builder: (context, child) => const Text(
        // Step 7: Pass the string content that will be displayed on the screen
        'Hello, Flutter!',
        // Step 8: Explicitly set text direction to Left-To-Right since WidgetsApp lacks Material/iOS defaults
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}
