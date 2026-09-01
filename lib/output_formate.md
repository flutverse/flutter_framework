
📂 Flutter_UI/01.Display_System/01.Text/01.NormalText
📄 01.Simple_Code.dart
(বেসিক ৪-৫টি প্রোপার্টি সহ ১০০% রানযোগ্য ক্লিন কোড)
code
Dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'হ্যালো ফ্ল্যাটার ডেভেলপার!',               // data: স্ক্রিনে প্রদর্শিত মূল টেক্সট
            textAlign: TextAlign.center,              // টেক্সট মাঝখানে অ্যালাইন হবে
            maxLines: 2,                              // সর্বোচ্চ ২ লাইনে টেক্সট দেখাবে
            overflow: TextOverflow.ellipsis,          // বেশি বড় লেখা হলে শেষে '...' দেখাবে
            softWrap: true,                           // উইডথ শেষ হলে স্বয়ংক্রিয় নতুন লাইনে যাবে
            style: TextStyle(
              fontSize: 20.0,                         // ফন্টের সাইজ
              fontWeight: FontWeight.bold,            // লেখা মোটা (Bold) হবে
              color: Colors.blueAccent,               // টেক্সটের রঙ
              letterSpacing: 1.2,                     // অক্ষরের মধ্যকার ফাঁকা জায়গা
            ),
          ),
        ),
      ),
    );
  }
}
📄 02.Dictionary.md
(লক করা রেফারেন্স ফরম্যাট)
📖 Text Widget Dictionary

1. Basic Info & Key Terms
   Term	Definition
   Widget Class	Text
   Inheritance	Object → DiagnosticableTree → Widget → StatelessWidget → Text
   Render Object	RenderParagraph
   Purpose	সিঙ্গেল-স্টাইলের সাধারণ টেক্সট স্ক্রিনে ডিসপ্লে করার প্রাথমিক উইজেট।
2. Properties / Parameters Table
   Property	Type	Default Value	Description
   data	String	(Required)	ডিসপ্লে করার মূল টেক্সট স্ট্রিং।
   style	TextStyle?	DefaultTextStyle	কালার, সাইজ, ফন্ট ওয়েট ইত্যাদি স্টাইলিং।
   strutStyle	StrutStyle?	null	লাইনগুলোর মিনিমাম ভার্টিকাল হাইট নির্ধারণ করে।
   textAlign	TextAlign?	TextAlign.start	অনুভূমিক এলাইনমেন্ট (বাম, ডান, সেন্টার)।
   textDirection	TextDirection?	Directionality	লেখার দিক (LTR বা RTL)।
   locale	Locale?	null	নির্দিষ্ট ভাষার ফন্ট রেন্ডারিং সিলেক্ট করে।
   softWrap	bool?	true	লাইনের শেষে স্বয়ংক্রিয় লাইন ব্রেক করবে কিনা।
   overflow	TextOverflow?	TextOverflow.clip	কন্টেইনার ওভারফ্লো করলে কীভাবে দেখাবে।
   textScaler	TextScaler?	TextScaler.noScaling	সিস্টেম ফন্ট সাইজ স্কেলিং কন্ট্রোল করে।
   maxLines	int?	null	টেক্সটের জন্য সর্বোচ্চ লাইনের সংখ্যা।
   semanticsLabel	String?	null	স্ক্রিন রিডারের (Accessibility) জন্য টেক্সট।
   textWidthBasis	TextWidthBasis?	TextWidthBasis.parent	উইডথ প্যারেন্ট নাকি কনটেন্ট অনুযায়ী মাপবে।
   textHeightBehavior	TextHeightBehavior?	null	প্রথম ও শেষ লাইনের অ্যাসেন্ট/ডিসেন্ট স্পেসিং কন্ট্রোল।
   selectionColor	Color?	null	সিলেক্ট করলে যে হাইলাইট কালার দেখাবে।
3. Associated Enums & Values
   TextAlign
   TextAlign.left → বাম দিকে এলাইন করে।
   TextAlign.right → ডান দিকে এলাইন করে।
   TextAlign.center → মাঝে এলাইন করে।
   TextAlign.justify → দুই প্রান্ত সমান রেখে স্পেস অ্যাডজাস্ট করে।
   TextAlign.start → টেক্সট ডিরেকশনের শুরুর প্রান্তে রাখে।
   TextAlign.end → টেক্সট ডিরেকশনের শেষ প্রান্তে রাখে।
   TextOverflow
   TextOverflow.clip → অতিরিক্ত অংশ কেটে ফেলে।
   TextOverflow.fade → শেষের অংশ ফেড (Fade) করে দেয়।
   TextOverflow.ellipsis → শেষের অংশে তিনটি ডট (...) দেখায়।
   TextOverflow.visible → বাউন্ডারি ভেঙে বাইরে চলে গেলেও দেখায়।
   TextDirection
   TextDirection.ltr → Left-to-Right (বাম থেকে ডানে)।
   TextDirection.rtl → Right-to-Left (ডান থেকে বামে)।
   TextWidthBasis
   TextWidthBasis.parent → প্যারেন্ট উইজেটের সম্পূর্ণ উইডথ ব্যবহার করে।
   TextWidthBasis.longestLine → সবচেয়ে বড় লাইনের দৈর্ঘ্য অনুযায়ী উইডথ সীমাবদ্ধ করে।
   💻 03.Full_Demo.dart
   (সব প্রোপার্টি ও এনামের ব্যবহার + ১ লাইনের বাংলা কমেন্ট)
   code
   Dart
   import 'dart:ui' as ui;
   import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextFullDemoScreen(),
    );
  }
}

class TextFullDemoScreen extends StatelessWidget {
  const TextFullDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Widget: All Properties Demo'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ১. সব প্রোপার্টি সহ মাস্টার টেক্সট উইজেট
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Text(
                'ফ্ল্যাটার একটি ওপেন সোর্স ফ্রেমওয়ার্ক যা দিয়ে যেকোনো প্ল্যাটফর্মের জন্য সিঙ্গেল কোডবেস থেকে চমৎকার অ্যাপ বানানো যায়।', // data: মূল টেক্সট স্ট্রিং
                style: TextStyle(
                  inherit: true,                                        // প্যারেন্ট থিম থেকে স্টাইল উত্তরাধিকার নেবে কি না
                  color: Colors.blue.shade900,                          // টেক্সটের মূল ফন্ট কালার
                  backgroundColor: Colors.yellow.shade100,              // অক্ষরের পেছনের ব্যাকগ্রাউন্ড কালার
                  fontSize: 16.0,                                       // ফন্টের সাইজ
                  fontWeight: FontWeight.bold,                          // ফন্ট বোল্ড হবে
                  fontStyle: FontStyle.italic,                          // ইটালিক বা বাঁকা ফন্ট
                  letterSpacing: 1.2,                                   // অক্ষরের মধ্যকার ফাঁকা জায়গা
                  wordSpacing: 3.0,                                     // শব্দের মধ্যকার ফাঁকা জায়গা
                  textBaseline: TextBaseline.alphabetic,                // টেক্সট অ্যালাইনমেন্ট বেসলাইন
                  height: 1.4,                                          // লাইন হাইটের গুণক
                  leadingDistribution: ui.TextLeadingDistribution.even, // লাইনের উপরে-নিচে সমান স্পেসিং রাখা
                  locale: const Locale('bn', 'BD'),                     // বাংলা ফন্ট রেন্ডারিং লোকেল
                  shadows: const [                                      // টেক্সটের ড্রপ শ্যাডো লিস্ট
                    Shadow(offset: Offset(1.0, 1.0), blurRadius: 2.0, color: Colors.black26),
                  ],
                  decoration: TextDecoration.underline,                 // টেক্সটের নিচে আন্ডারলাইন
                  decorationColor: Colors.red,                          // ডেকোরেশন লাইনের রঙ
                  decorationStyle: TextDecorationStyle.wavy,            // ঢেউ খেলানো ডেকোরেশন লাইন
                  decorationThickness: 1.5,                             // ডেকোরেশন লাইনের পুরুত্ব
                  debugLabel: 'full_text_style',                        // ডিবাগিং লেবেল
                  overflow: TextOverflow.ellipsis,                      // স্টাইল লেভেলে ওভারফ্লো হ্যান্ডলিং
                ),
                strutStyle: const StrutStyle(fontSize: 16.0, height: 1.4), // প্রতিটি লাইনের মিনিমাম ভার্টিকাল উচ্চতা
                textAlign: TextAlign.justify,                           // লাইনের দুই প্রান্ত সমান স্পেস দিয়ে সাজানো
                textDirection: TextDirection.ltr,                       // লেখার গতিপথ বাম থেকে ডানে (LTR)
                locale: const Locale('bn', 'BD'),                       // উইজেট লেভেলে নির্দিষ্ট ভাষার লোকেল
                softWrap: true,                                         // লাইনের শেষে নিচে নতুন লাইনে নামবে কি না
                overflow: TextOverflow.ellipsis,                        // সর্বোচ্চ লাইনের বাইরে গেলে '...' দেখাবে
                textScaler: const TextScaler.linear(1.0),               // সিস্টেম ফন্ট স্কেলিং রেশিও কন্ট্রোল
                maxLines: 3,                                            // সর্বোচ্চ ৩ লাইনে সীমাবদ্ধ থাকবে
                semanticsLabel: 'Flutter Bangla Introduction',          // স্ক্রিন রিডারের অল্টারনেটিভ লেবেল
                textWidthBasis: TextWidthBasis.parent,                  // মোট উইডথ প্যারেন্ট বাউন্ডারি অনুযায়ী হবে
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: true,                       // প্রথম লাইনের উপরের স্পেস ঠিক রাখা
                  applyHeightToLastDescent: true,                        // শেষ লাইনের নিচের স্পেস ঠিক রাখা
                  leadingDistribution: ui.TextLeadingDistribution.even, // স্পেসিং সমানভাবে ভাগ করা
                ),
                selectionColor: Colors.orangeAccent,                    // টেক্সট সিলেক্ট করলে ব্যাকগ্রাউন্ড হাইলাইট কালার
              ),
            ),
            const SizedBox(height: 16),

            // ২. TextAlign এনামের সব ভ্যালু
            _buildSection(
              title: 'TextAlign Enum Variants',
              child: Column(
                children: [
                  _buildRow('start', const Text('Start Aligned', textAlign: TextAlign.start)),
                  _buildRow('center', const Text('Center Aligned', textAlign: TextAlign.center)),
                  _buildRow('end', const Text('End Aligned', textAlign: TextAlign.end)),
                  _buildRow('justify', const Text('Justify text spanning full width equally', textAlign: TextAlign.justify)),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ৩. TextOverflow এনামের সব ভ্যালু
            _buildSection(
              title: 'TextOverflow Enum Variants (Box: 190px)',
              child: Column(
                children: [
                  _buildOverflowRow('ellipsis', TextOverflow.ellipsis),
                  _buildOverflowRow('clip', TextOverflow.clip),
                  _buildOverflowRow('fade', TextOverflow.fade),
                  _buildOverflowRow('visible', TextOverflow.visible),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ৪. TextDirection ও TextWidthBasis এনাম
            _buildSection(
              title: 'TextDirection & TextWidthBasis',
              child: Column(
                children: [
                  _buildRow('LTR', const Text('Left to Right Direction', textDirection: TextDirection.ltr)),
                  _buildRow('RTL', const Text('Right to Left Direction', textDirection: TextDirection.rtl)),
                  _buildRow('parent', const Text('TextWidthBasis.parent', textWidthBasis: TextWidthBasis.parent)),
                  _buildRow('longestLine', const Text('TextWidthBasis.longestLine', textWidthBasis: TextWidthBasis.longestLine)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // সেকশন কার্ড বিল্ডার
  Widget _buildSection({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const Divider(height: 20),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, Widget textWidget) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text('$label:', style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
          Expanded(child: Container(color: Colors.black12, padding: const EdgeInsets.all(4), child: textWidget)),
        ],
      ),
    );
  }

  Widget _buildOverflowRow(String name, TextOverflow overflow) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(name, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
          Container(
            width: 190,
            padding: const EdgeInsets.all(4),
            color: Colors.black12,
            child: Text(
              'Very long text overflowing the box limit',
              maxLines: 1,
              softWrap: false,
              overflow: overflow,
            ),
          ),
        ],
      ),
    );
  }
}
