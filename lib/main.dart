import 'package:flutter/material.dart';
import 'package:hotebookingui/Screens/details.dart';
import 'package:hotebookingui/Screens/homepage.dart';
import 'package:hotebookingui/Widgets/cimage.dart';
import 'package:hotebookingui/Widgets/ctext.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Homepage(),
    );
  }
}
