import 'package:flutter/widgets.dart';

void main() {
  runApp(
    WidgetsApp(
      // ১. অ্যাপের প্রাথমিক প্রাইমারি কালার (Task Switcher-এ ব্যবহৃত হয়)
      color: const Color(0xFF2196F3),

      // ২. ডিফল্ট টেক্সট স্টাইল নির্ধারণ (WidgetsApp-এ Material-এর default TextStyle থাকে না)
      textStyle: const TextStyle(
        fontSize: 18,
        color: Color(0xFF000000),
        fontFamily: 'sans-serif',
      ),

      // ৩. কাস্টম রাউটিং ম্যানেজমেন্ট (onGenerateRoute বাধ্যতামূলক)
      onGenerateRoute: (RouteSettings settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return Container(
              color: const Color(0xFFF5F5F5), // ব্যাকগ্রাউন্ড কালার
              child: Directionality(
                textDirection: TextDirection.ltr, // টেক্সট ডিরেকশন বাধ্যতামূলক
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF6200EE),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Hello, Custom WidgetsApp!',
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
