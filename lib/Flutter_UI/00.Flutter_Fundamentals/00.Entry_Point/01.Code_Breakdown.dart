import 'package:flutter/material.dart';

void main() {
  // ডার্ট প্রোগ্রামের এক্সিকিউশন শুরুর মূল ফাংশন (Entry Point)
  runApp(
    // ফ্ল্যাটার ইঞ্জিন চালু করে উইজেটকে ডিভাইসের স্ক্রিনে মাউন্ট করার ফাংশন
    WidgetsApp( // WidgetsApp: একটি কনফিগারেবল অ্যাপ্লিকেশন উইজেট যা MaterialApp এবং CupertinoApp এর জন্য বেস হিসেবে কাজ করে।
      // আমরা  MaterialApp / CupertinoApp ও WidgetsApp ব্যবহার করতে পারি।
      //MaterialApp / CupertinoApp হল WidgetsApp এর কনফিগারেশন উইজেট।
      //MaterialApp / CupertinoApp ব্যবহার করলে আমরা Material Design / Cupertino Design এর সুবিধা পাবো।
      //কিন্তু WidgetsApp ব্যবহার করলে আমরা Material Design / Cupertino Design এর সুবিধা পাবো না।
      //আমরা চাইলে WidgetsApp ব্যবহার করে আমাদের নিজস্ব কাস্টম ডিজাইন তৈরি করতে পারি।
      color: Colors
          .white, // উইজেট অ্যাপ্লিকেশনের প্রাথমিক ব্যাকগ্রাউন্ড কালার নির্ধারণ করা
      // উইজেট অ্যাপ্লিকেশনের রুট কনফিগারেশন উইজেট
    ),
  );
}
