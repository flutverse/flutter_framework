// Step 1: Import the Material UI component library provided by Flutter
import 'package:flutter/material.dart';

// Step 2: Main entry point function where execution of the Dart application starts
void main() {
  // Step 3: Call runApp to inflate the root StatefulWidget onto the device screen
  runApp(
    // Step 4: Instantiate the top-level root StatefulWidget of our application
    const MyApp(),
  );
}

// Step 5: Declare a class named 'MyApp' extending StatefulWidget (UI that can change state over time)
class MyApp extends StatefulWidget {
  // Step 6: Pass the optional key parameter to the superclass constructor
  const MyApp({super.key});

  // Step 7: Override createState to instantiate and link the mutable State object to this widget
  @override
  State<MyApp> createState() => _MyAppState();
}

// Step 8: Declare the State class holding mutable data and build logic, private to this file (prefixed with '_')
class _MyAppState extends State<MyApp> {
  // Step 9: Declare an integer variable 'counter' initialized to 0 to hold our dynamic state value
  int counter = 0;

  // Step 10: Override the build method which re-executes whenever setState() is called
  @override
  Widget build(BuildContext context) {
    // Step 11: Return MaterialApp as the main root wrapper for material styling and navigation
    return MaterialApp(
      // Step 12: Set the title metadata for the application
      title: 'Stateful App',
      // Step 13: Provide Scaffold as the foundational page design layout
      home: Scaffold(
        // Step 14: Add an AppBar at the top of the screen layout
        appBar: AppBar(
          // Step 15: Display the app bar header text
          title: const Text('Stateful MyApp'),
        ),
        // Step 16: Define the main body content area centered on the screen
        body: Center(
          // Step 17: Column widget arranges its children vertically from top to bottom
          child: Column(
            // Step 18: Center children vertically along the main axis of the Column
            mainAxisAlignment: MainAxisAlignment.center,
            // Step 19: List of widgets rendered inside the Column layout container
            children: [
              // Step 20: Display a Text widget with dynamic string interpolation to show current counter value
              Text(
                'Counter Value: $counter',
                // Step 21: Apply custom text size styling
                style: const TextStyle(fontSize: 24),
              ),
              // Step 22: Add an invisible box to create a 16-pixel vertical gap between widgets
              const SizedBox(height: 16),
              // Step 23: Create an interactive button widget with a background fill
              ElevatedButton(
                // Step 24: Define the callback function triggered when the user clicks the button
                onPressed: () {
                  // Step 25: Call setState to notify the framework that internal state changed and rebuild UI
                  setState(() {
                    // Step 26: Increment the counter variable by 1
                    counter++;
                  });
                },
                // Step 27: Define the label text widget displayed inside the button
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
