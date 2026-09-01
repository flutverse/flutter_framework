import 'package:flutter/material.dart'; //......

void main() {//.....
  runApp(//.....
    const MaterialApp(//......
      debugShowCheckedModeBanner: false,//.....
      title: 'Root App',//....
      home: Scaffold(//....
        body: Text(//....
          'হ্যালো ফ্ল্যাটার ডেভেলপার!', // স্ক্রিনে যে টেক্সট বা স্ট্রিং প্রদর্শিত হবে
          // অক্ষরের মাঝে ১.২ গ্যাপ থাকবে
        ), 
      ),
    ),
  );
}
class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}