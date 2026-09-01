import 'package:flutter/material.dart'; // মেটেরিয়াল প্যাকেজ

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(const MyApp()); // MyApp চালানো
}

class MyApp extends StatefulWidget {
  // একক মাস্টার স্টেটফুল উইজেট
  const MyApp({super.key}); // কনস্ট্রাক্টর

  @override // মেথড ওভাররাইড
  State<MyApp> createState() => _MyAppState(); // স্টেট ইনস্ট্যান্স তৈরি
}

class _MyAppState extends State<MyApp> {
  // স্টেট ও লজিক ক্লাস
  int _counter = 0; // কাউন্টার ডাটা
  String _lastEvent = 'initState() সম্পন্ন হয়েছে'; // সর্বশেষ ইভেন্টের নাম

  @override // লাইফসাইকেল ১: initState
  void initState() {
    // স্টেট তৈরি হওয়ার সময় ১ বার চলে
    super.initState(); // প্যারেন্ট ইনিশিয়ালাইজ
  }

  @override // লাইফসাইকেল ২: didChangeDependencies
  void didChangeDependencies() {
    // থিম বা ডিপেন্ডেন্সি পরিবর্তন হলে কল হয়
    super.didChangeDependencies(); // প্যারেন্ট মেথড
  }

  @override // লাইফসাইকেল ৪: deactivate
  void deactivate() {
    // ট্রি থেকে সাময়িক রিমুভ করা হলে কল হয়
    super.deactivate(); // প্যারেন্ট কল
  }

  @override // লাইফসাইকেল ৫: dispose
  void dispose() {
    // মেমরি থেকে স্থায়ীভাবে ডিলিট হওয়ার সময় ক্লিনআপ করে
    super.dispose(); // মেমরি রিলিজ
  }

  @override // লাইফসাইকেল ৩: build
  Widget build(BuildContext context) {
    // ইনিশিয়াল রেন্ডারে এবং প্রতিবার setState-এ চলে
    return MaterialApp(
      // মেটেরিয়াল অ্যাপ
      debugShowCheckedModeBanner: false, // ডিবাগ অফ
      home: lifecycle(),
    );
  }

  Widget lifecycle() {
    return Scaffold(
      // স্ক্রিন লেআউট
      appBar: AppBar(
        // হেডার
        title: const Text('StatefulWidget Lifecycle'), // হেডার টেক্সট
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
            Text(
              'কাউন্টার: $_counter', // কাউন্টার ভ্যালু দেখানো
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20), // স্পেস
            Text(
              'সর্বশেষ ইভেন্ট: $_lastEvent', // সর্বশেষ ইভেন্ট দেখানো
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // বাটন
        onPressed: () {
          // ক্লিক ইভেন্ট
          setState(() {
            // স্টেট আপডেটের নোটিফিকেশন দেওয়া
            _counter++; // কাউন্টার ১ বাড়ানো
            _lastEvent = 'setState() কল হয়েছে'; // সর্বশেষ ইভেন্ট আপডেট করা
          });
        },
        child: const Icon(Icons.add), // প্লাস আইকন
      ),
    );
  }
}
