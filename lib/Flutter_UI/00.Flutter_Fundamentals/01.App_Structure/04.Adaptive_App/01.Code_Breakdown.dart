import 'package:flutter/material.dart'; // মেটেরিয়াল লাইব্রেরি ইমপোর্ট
import 'package:flutter/cupertino.dart'; // কিউপারটিনো লাইব্রেরি ইমপোর্ট

void main() {
  // অ্যাপ শুরুর মূল ফাংশন
  runApp(const MyApp()); // MyApp স্ক্রিনে মাউন্ট করা
}

class MyApp extends StatelessWidget {
  // একক রুট ক্লাস
  const MyApp({super.key}); // কনস্ট্রাক্টর

  @override // মেথড ওভাররাইড
  Widget build(BuildContext context) {
    // ইউআই ট্রি রিটার্ন
    return MaterialApp(
      // মেটেরিয়াল অ্যাপ র‍্যাপার
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার অফ
      home: Scaffold(
        // বেসিক স্ক্রিন লেআউট
        body: Center(
          // স্ক্রিনের মাঝে রাখা
          child: Switch.adaptive(
            // অ্যান্ড্রয়েডে মেটেরিয়াল এবং আইওএসে কিউপারটিনো সুইচ দেখাবে
            value: true, // সুইচের বর্তমান অবস্থা (অন)
            onChanged: (bool value) {}, // সুইচে ট্যাপ করলে কী ঘটবে
          ),
        ),
      ),
    );
  }
}
