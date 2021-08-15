import 'package:aprovik/login.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AproviK',
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Color(0xFFE8F1F2)),
      home: LoginScreen(),
    );
  }
}
