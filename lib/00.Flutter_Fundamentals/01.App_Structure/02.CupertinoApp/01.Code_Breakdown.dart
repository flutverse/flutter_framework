import 'package:flutter/cupertino.dart'; // অ্যাপল/আইওএস (iOS) কিউপারটিনো প্যাকেজ ইমপোর্ট

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(
    CupertinoApp(
      // আইওএস স্টাইলের মূল রুট কনফিগারেশন উইজেট
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার বন্ধ করা
      title: 'Cupertino Demo', // অ্যাপ টাইটেল
      home: CupertinoPageScaffold(
        // আইওএস স্টাইলের মূল স্ক্রিন ফ্রেম
        navigationBar: CupertinoNavigationBar(
          // আইওএস স্টাইলের উপরের টাইটেল বার
          middle: Text('CupertinoApp বেসিক'), // মাঝখানের টাইটেল টেক্সট
        ),
        child: Center(
          // কনটেন্ট মাঝে রাখা
          child: Text('Apple iOS Design Setup'), // টেক্সট
        ),
      ),
    ),
  );
}
