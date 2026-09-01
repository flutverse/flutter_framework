import 'package:flutter/material.dart'; // মেটেরিয়াল প্যাকেজ

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(
    MaterialApp(
      // মেটেরিয়াল অ্যাপ কনফিগারেশন
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার অফ
      title: 'MaterialApp Master', // অ্যাপের শিরোনাম
      themeMode: ThemeMode.system, // ওএস অনুযায়ী থিম মোড
      color:
          Colors.blueAccent, // ওএস টাস্ক ম্যানেজারে প্রাইমারি ব্র্যান্ড কালার
      home: Scaffold(
        // মূল স্ক্রিন লেআউট
        appBar: AppBar(
          // উপরের টাইটেল বার
          title: const Text('MaterialApp Full Demo'), // টাইটেল টেক্সট
          centerTitle: true, // লেখা মাঝে রাখা
          backgroundColor: Colors.blueAccent, // ব্যাকগ্রাউন্ড কালার
          foregroundColor: Colors.white, // লেখার কালার
        ),
        body: const Center(
          // স্ক্রিনের কেন্দ্রে কন্টেন্ট রাখা
          child: // স্পেস
          Text(
            // হেডলাইন টেক্সট
            'Google Material Design Standard', // টেক্সট
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ), // স্টাইল
          ),
        ),
      ),
    ),
  );
}
