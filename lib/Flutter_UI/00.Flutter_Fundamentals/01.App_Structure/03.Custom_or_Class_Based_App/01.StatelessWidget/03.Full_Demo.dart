import 'package:flutter/material.dart'; // মেটেরিয়াল প্যাকেজ

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(const MyApp()); // অ্যাপ চালানো
}

class MyApp extends StatelessWidget {
  // একক ক্লাস
  const MyApp({super.key}); // কনস্ট্রাক্টর

  @override // মেথড ওভাররাইড
  Widget build(BuildContext context) {
    // ইউআই বিল্ড
    return homePage(); // হোমপেজ রিটার্ন}
  }

  Widget homePage() {
    return Scaffold(
      // স্ক্রিন লেআউট
      appBar: AppBar(
        // হেডার
        title: const Text('StatelessWidget Lifecycle'), // হেডার টেক্সট
        centerTitle: true, // মাঝে রাখা
        backgroundColor: Colors.blueAccent, // হেডার কালার
        foregroundColor: Colors.white, // লেখার কালার
      ),
      body: Center(
        // সেন্টারে রাখা
        child: Column(
          // উপর-নিচে সাজানো
          mainAxisAlignment: MainAxisAlignment.center, // মাঝে এলাইন
          children: [
            // আইটেম লিস্ট
            const Text(
              'StatelessWidget: অপরিবর্তনশীল ইউআই', // স্ক্রিনের টেক্সট
              style: TextStyle(fontSize: 22), // ফন্ট সাইজ
            ),
          ],
        ),
      ),
    );
  }
}
