import 'package:flutter/material.dart';
import 'package:taskapp/chatscreen.dart';
import 'package:taskapp/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter chat',
      theme: ThemeData(
        
     
        primarySwatch: Colors.blue,
      ),
      home: Homepage()
    );
  }
}
