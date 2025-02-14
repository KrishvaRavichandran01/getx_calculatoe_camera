import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:test_process/Main_page.dart';
import 'provider_calculator.dart';


void main() {
  runApp( ChangeNotifierProvider(
    create: (_) =>  ProviderCalculation(),
    child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEDE7F6),
        scaffoldBackgroundColor: Color(0xFFEDE7F6),


      ),
      home: MainScreen(),
    );
  }
}
