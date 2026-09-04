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

// Step 5: Declare the MyApp class that extends StatelessWidget (a static, unchanging root container)
class MyApp extends StatelessWidget {
  // Step 6: Create a constant constructor and forward the optional key parameter to the superclass
  const MyApp({super.key});

  // Step 7: Override the build method which describes the app's root structure
  @override
  Widget build(BuildContext context) {
    // Step 8: Return CupertinoApp to configure global iOS styling and navigation settings
    return const CupertinoApp(
      // Step 9: Set the title metadata used by the device operating system
      title: 'Cupertino StatelessWidget App',
      // Step 10: Set our custom StatelessWidget screen as the primary home screen layout
      home: MyHomeScreen(),
    );
  }
}

// Step 11: Declare a custom class that extends StatelessWidget (UI that never changes dynamically)
class MyHomeScreen extends StatelessWidget {
  // Step 12: Pass the optional key parameter to the superclass constructor
  const MyHomeScreen({super.key});

  // Step 13: Override the build method which describes how to render this screen layout
  @override
  Widget build(BuildContext context) {
    // Step 14: Return CupertinoPageScaffold to provide standard iOS background and layout boundaries
    return const CupertinoPageScaffold(
      // Step 15: Add an iOS-style navigation bar at the top of the screen
      navigationBar: CupertinoNavigationBar(
        // Step 16: Set the header title displayed inside the top navigation bar
        middle: Text('Cupertino StatelessWidget'),
      ),
      // Step 17: Place child content inside the main body slot of the iOS scaffold
      child: Center(
        // Step 18: Center widget aligns its child directly in the middle of the available space
        child: Text(
          // Step 19: Display text rendered with native iOS typography defaults
          'Hello from Cupertino StatelessWidget!',
          // Step 20: Apply iOS font sizing for clear visual hierarchy
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
