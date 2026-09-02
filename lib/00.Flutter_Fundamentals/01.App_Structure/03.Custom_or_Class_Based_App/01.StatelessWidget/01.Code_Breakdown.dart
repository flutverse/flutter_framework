import 'package:flutter/material.dart'; // মেটেরিয়াল লাইব্রেরি

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(const MyApp()); // MyApp রান করা
}

class MyApp extends StatelessWidget {
  // অপরিবর্তনশীল (Immutable) উইজেট ক্লাস
  const MyApp({super.key}); // কনস্ট্যান্ট কনস্ট্রাক্টর

  @override // বিল্ড মেথড ওভাররাইড করা
  Widget build(BuildContext context) {
    // স্ক্রিনে ইউআই রেন্ডার করার বাধ্যতামূলক মেথড
    return const MaterialApp(
      // মেটেরিয়াল অ্যাপ
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার অফ
      home: Scaffold(
        // লেআউট
        body: Center(
          // সেন্টারে রাখা
          child: Text(
            // টেক্সট
            'StatelessWidget: অপরিবর্তনশীল ইউআই', // স্ক্রিনের টেক্সট
          ),
        ),
      ),
    );
  }
}
