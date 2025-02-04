import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_process/Main_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        scaffoldBackgroundColor: Color(0xFFEDE7F6),


      ),
      home: MainScreen(),
    );
  }
}
