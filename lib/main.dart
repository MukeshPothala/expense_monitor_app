import 'package:flutter/material.dart';
import 'package:expense_monitor_app/home_page.dart';

void main() {
  MyApp appObj = const MyApp();
  runApp(appObj);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}