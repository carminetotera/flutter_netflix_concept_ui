import 'package:flutter/material.dart';
import 'package:netflix_ui/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Redesign',
      theme: ThemeData(),
      home: Home(),
    );
  }
}
