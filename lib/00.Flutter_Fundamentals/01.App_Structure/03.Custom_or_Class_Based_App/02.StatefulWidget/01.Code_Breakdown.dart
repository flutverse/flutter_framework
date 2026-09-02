import 'package:flutter/material.dart'; // মেটেরিয়াল প্যাকেজ ইমপোর্ট

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(const MyApp()); // MyApp রান করা
}

class MyApp extends StatefulWidget {
  // পরিবর্তনশীল স্টেট ধারণকারী উইজেট ক্লাস
  const MyApp({super.key}); // কনস্ট্রাক্টর

  @override // মেথড ওভাররাইড
  State<MyApp> createState() => _MyAppState(); // স্টেট অবজেক্ট তৈরি করে রিটার্ন করা
}

class _MyAppState extends State<MyApp> {
  // স্টেট ও বিজনেস লজিক ধারণকারী ক্লাস
  int _counter = 0; // পরিবর্তনশীল স্টেট ডাটা ভ্যারিয়েবল

  @override // লাইফসাইকেল মেথড ১
  void initState() {
    // স্টেট তৈরির সময় মেমরিতে মাত্র ১ বার চলে
    super.initState(); // প্যারেন্ট ক্লাসের মেথড কল
  }

  @override // লাইফসাইকেল মেথড ৩
  void dispose() {
    // স্ক্রিন মেমরি থেকে স্থায়ীভাবে ডিলিট হওয়ার সময় ক্লিনআপ করে
    super.dispose(); // মেমরি রিলিজ
  }

  @override // লাইফসাইকেল মেথড ২
  Widget build(BuildContext context) {
    // স্টেট পরিবর্তন হলে প্রতিবার ইউআই রি-ড্র করে
    return MaterialApp(
      // মেটেরিয়াল অ্যাপ
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার অফ
      home: Scaffold(
        // পেজ ফ্রেম
        body: Center(
          // সেন্টারে রাখা
          child: Text(
            'কাউন্টার: $_counter',
            style: const TextStyle(fontSize: 22),
          ), // ভ্যালু দেখানো
        ),
        floatingActionButton: FloatingActionButton(
          // বাটন
          onPressed: () {
            // ক্লিক ইভেন্ট
            setState(() {
              // স্টেট আপডেটের নোটিফিকেশন দেওয়া
              _counter++; // ভ্যালু ১ বাড়ানো
            });
          },
          child: const Icon(Icons.add), // প্লাস আইকন
        ),
      ),
    );
  }
}
