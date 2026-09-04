// Step 1: Import the Material UI component library provided by Flutter
import 'package:flutter/material.dart';

// Step 2: Main entry point function where execution of the Dart application starts
void main() {
  // Step 3: Call runApp to inflate the given widget and attach it to the screen
  runApp(
    // Step 4: Instantiate the top-level root widget of our application using const for optimization
    const MyApp(),
  );
}

// Step 5: Declare a class named 'MyApp' that extends StatelessWidget (UI that never changes dynamically)
class MyApp extends StatelessWidget {
  // Step 6: Define a constant constructor for MyApp and forward the optional key parameter to the superclass
  const MyApp({super.key});

  // Step 7: Override the build method which describes the part of the user interface represented by this widget
  @override
  Widget build(BuildContext context) {
    // Step 8: Return a MaterialApp widget which sets up the visual structure, routing, and theme of the app
    return MaterialApp(
      // Step 9: Define the title of the application (used by the device OS task manager)
      title: 'Stateless App',
      // Step 10: Set the home property which acts as the main default route/screen displayed on launch
      home: Scaffold(
        // Step 11: Set the top app bar slot of the Scaffold page layout
        appBar: AppBar(
          // Step 12: Place a Text widget inside the AppBar to display the title string
          title: const Text('Stateless MyApp'),
        ),
        // Step 13: Define the main body content area of the Scaffold page layout
        body: const Center(
          // Step 14: Center widget aligns its child widget directly in the middle of the screen space
          child: Text(
            // Step 15: Display a static string message on the screen
            'Hello from MyApp!',
            // Step 16: Apply text styling to increase the readability of the text
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
