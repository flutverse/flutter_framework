import 'package:flutter/cupertino.dart'; // কিউপারটিনো প্যাকেজ ইমপোর্ট

void main() {
  // এন্ট্রি পয়েন্ট
  runApp(
    CupertinoApp(
      // আইওএস অ্যাপ কনফিগারেশন
      debugShowCheckedModeBanner: false, // ডিবাগ ব্যানার অফ
      title: 'Cupertino Full Demo', // অ্যাপ টাইটেল
      home: CupertinoPageScaffold(
        // আইওএস স্ক্রিন লেআউট
        navigationBar: CupertinoNavigationBar(
          // কিউপারটিনো নেভিগেশন বার
          middle: Text('iOS CupertinoApp Demo'), // হেডার টেক্সট
          backgroundColor: CupertinoColors.systemGrey6, // হেডার কালার
        ),
        child: SafeArea(
          // স্ক্রিনের খাঁজ ও সেইফ এরিয়া বজায় রাখা
          child: Center(
            // মাঝে রাখা
            child: Column(
              // উপর-নিচে সাজানো
              mainAxisAlignment: MainAxisAlignment.center, // ভার্টিকালি মাঝে
              children: [
                // আইটেম লিস্ট
                Icon(
                  CupertinoIcons.app,
                  size: 60,
                  color: CupertinoColors.activeBlue,
                ), // অ্যাপ লোগো আইকন
                SizedBox(height: 12), // স্পেস
                Text(
                  // হেডলাইন
                  'Apple Human Interface Guidelines', // টেক্সট
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ), // টেক্সট স্টাইল
                ),
                SizedBox(height: 12), // স্পেস
                CupertinoButton.filled(
                  // আইওএস স্টাইলের ফিল্ড বাটন
                  onPressed: null, // বাটন অ্যাকশন
                  child: Text('iOS Style Button'), // বাটনের লেবেল
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
