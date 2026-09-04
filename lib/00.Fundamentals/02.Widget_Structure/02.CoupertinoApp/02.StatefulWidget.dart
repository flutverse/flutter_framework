// Step 1: Import Flutter's Cupertino package containing Apple (iOS-style) components
import 'package:flutter/cupertino.dart';

// Step 2: The main entry point function where execution of the Dart application starts
void main() {
  // Step 3: Tell Flutter to start drawing the root widget onto the device screen
  runApp(
    // Step 4: Instantiate our custom root application class using compile-time constant memory optimization
    const MyApp(),
  );
}

// Step 5: Declare the MyApp class that extends StatelessWidget (static root configuration)
class MyApp extends StatelessWidget {
  // Step 6: Create a constant constructor and forward the optional key parameter to the superclass
  const MyApp({super.key});

  // Step 7: Override the build method which describes the app's root structure
  @override
  Widget build(BuildContext context) {
    // Step 8: Return CupertinoApp to configure global iOS styling, themes, and navigation
    return const CupertinoApp(
      // Step 9: Set the title metadata used by the device operating system
      title: 'Cupertino StatefulWidget App',
      // Step 10: Set our custom StatefulWidget screen as the primary home screen layout
      home: MyHomeScreen(),
    );
  }
}

// Step 11: Declare a custom class extending StatefulWidget (UI that can change state over time)
class MyHomeScreen extends StatefulWidget {
  // Step 12: Pass the optional key parameter to the superclass constructor
  const MyHomeScreen({super.key});

  // Step 13: Override createState to create and attach the mutable State object to this widget
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

// Step 14: Declare the State class holding mutable data and build logic, private to this file (prefixed with '_')
class _MyHomeScreenState extends State<MyHomeScreen> {
  // Step 15: Declare an integer variable 'counter' initialized to 0 to hold our dynamic state value
  int counter = 0;

  // Step 16: Override the build method which re-executes whenever setState() is called
  @override
  Widget build(BuildContext context) {
    // Step 17: Return CupertinoPageScaffold to provide standard iOS background and layout boundaries
    return CupertinoPageScaffold(
      // Step 18: Add an iOS-style navigation bar at the top of the screen
      navigationBar: const CupertinoNavigationBar(
        // Step 19: Set the header title displayed inside the top navigation bar
        middle: Text('Cupertino StatefulWidget'),
      ),
      // Step 20: Define the child content area centered on the screen space
      child: Center(
        // Step 21: Column widget arranges its children vertically from top to bottom
        child: Column(
          // Step 22: Center children vertically along the main axis of the Column
          mainAxisAlignment: MainAxisAlignment.center,
          // Step 23: List of widgets rendered inside the Column layout container
          children: [
            // Step 24: Display text showing current counter value using dynamic string interpolation
            Text(
              'Counter Value: $counter',
              // Step 25: Apply custom font size styling
              style: const TextStyle(fontSize: 22),
            ),
            // Step 26: Add an invisible box to create a 20-pixel vertical gap between widgets
            const SizedBox(height: 20),
            // Step 27: Create an interactive iOS-styled button with a filled accent background
            CupertinoButton.filled(
              // Step 28: Define the callback function triggered when the user taps the button
              onPressed: () {
                // Step 29: Call setState to notify Flutter that internal state changed and rebuild UI
                setState(() {
                  // Step 30: Increment the counter variable by 1
                  counter++;
                });
              },
              // Step 31: Define the label text widget displayed inside the iOS button
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
