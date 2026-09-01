import 'package:flutter/material.dart'; // মেটেরিয়াল প্যাকেজ
import 'package:flutter/cupertino.dart'; // কিউপারটিনো প্যাকেজ

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(const MyApp()); // অ্যাপ চালানো
}

class MyApp extends StatefulWidget {
  // একক মাস্টার স্টেটফুল ক্লাস
  const MyApp({super.key}); // কনস্ট্রাক্টর

  @override // মেথড ওভাররাইড
  State<MyApp> createState() => _MyAppState(); // স্টেট ইনস্ট্যান্স তৈরি
}

class _MyAppState extends State<MyApp> {
  // স্টেট ধারণকারী ক্লাস
  bool _switchVal = true; // সুইচের স্টেট ভ্যারিয়েবল
  double _sliderVal = 50.0; // স্লাইডারের স্টেট ভ্যারিয়েবল

  @override // বিল্ড মেথড
  Widget build(BuildContext context) {
    // ইউআই ট্রি রিটার্ন
    final isIOS =
        Theme.of(context).platform ==
        TargetPlatform.iOS; // বর্তমান ওএস কি অ্যাপল আইওএস কি না তা চেক করা

    return MaterialApp(
      // মূল অ্যাপ র‍্যাপার
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার অফ
      theme: ThemeData(useMaterial3: true), // মেটেরিয়াল ৩ থিম সক্রিয় করা
      home: Scaffold(
        // পেজ ফ্রেম
        appBar: AppBar(
          // হেডার বার
          title: const Text('Material + Cupertino Adaptive'), // হেডার টেক্সট
          centerTitle: true, // মাঝে রাখা
          backgroundColor: Colors.blueAccent, // হেডার কালার
          foregroundColor: Colors.white, // লেখার কালার
        ),
        body: Padding(
          // পেজ প্যাডিং
          padding: const EdgeInsets.all(20.0), // ২০ পিক্সেল প্যাডিং
          child: Column(
            // উপর-নিচে সাজানো
            mainAxisAlignment: MainAxisAlignment.center, // মাঝে এলাইন
            children: [
              // আইটেম লিস্ট
              Text(
                // ওএস ডিটেকশন টেক্সট
                isIOS
                    ? 'চলমান মোড: Apple iOS'
                    : 'চলমান মোড: Google Android', // প্ল্যাটফর্ম টেক্সট
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // ফন্ট স্টাইল
              ),
              const SizedBox(height: 20), // স্পেস
              Row(
                // সুইচ রো
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // দুই প্রান্তে রাখা
                children: [
                  // রো চিলড্রেন
                  const Text('১. Switch.adaptive:'), // লেবেল
                  Switch.adaptive(
                    // প্ল্যাটফর্ম অনুযায়ী সুইচ
                    value: _switchVal, // বর্তমান স্টেট
                    onChanged: (val) =>
                        setState(() => _switchVal = val), // টগল ইভেন্ট
                  ),
                ],
              ),
              const SizedBox(height: 16), // স্পেস
              Row(
                // স্লাইডার রো
                children: [
                  // রো চিলড্রেন
                  const Text('২. Slider.adaptive:'), // লেবেল
                  Expanded(
                    // বাকি জায়গা নেওয়া
                    child: Slider.adaptive(
                      // প্ল্যাটফর্ম অনুযায়ী স্লাইডার
                      min: 0, // সর্বনিম্ন ভ্যালু
                      max: 100, // সর্বোচ্চ ভ্যালু
                      value: _sliderVal, // বর্তমান ভ্যালু
                      onChanged: (val) =>
                          setState(() => _sliderVal = val), // স্লাইড ইভেন্ট
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16), // স্পেস
              const Row(
                // লোডার রো
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // দুই প্রান্তে রাখা
                children: [
                  // রো চিলড্রেন
                  Text('৩. CircularProgressIndicator.adaptive:'), // লেবেল
                  CircularProgressIndicator.adaptive(), // প্ল্যাটফর্ম অনুযায়ী স্পিনার
                ],
              ),
              const SizedBox(height: 24), // স্পেস
              isIOS // প্ল্যাটফর্ম অনুযায়ী আলাদা বাটন দেখানো
                  ? CupertinoButton.filled(
                      // আইওএস স্টাইল ফিল্ড বাটন
                      onPressed: () {}, // ক্লিক অ্যাকশন
                      child: const Text('Cupertino Button (iOS)'), // বাটন লেবেল
                    )
                  : ElevatedButton(
                      // অ্যান্ড্রয়েড মেটেরিয়াল বাটন
                      onPressed: () {}, // ক্লিক অ্যাকশন
                      child: const Text(
                        'Elevated Button (Android)',
                      ), // বাটন লেবেল
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
