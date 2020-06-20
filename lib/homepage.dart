import 'package:flutter/material.dart';
import 'package:taskapp/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taskapp/screen/home.dart';

class Homepagr extends StatefulWidget {
  @override
  _HomepagrState createState() => _HomepagrState();
}

class _HomepagrState extends State<Homepagr> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: _auth.onAuthStateChanged,
            builder: (ctx, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.hasData) {
                FirebaseUser user = snapshot.data;
                if (user != null) {
                  return HomeScreen();
                }
              } else {
                return Login();
              }
              return Login();
            }));
  }
}
