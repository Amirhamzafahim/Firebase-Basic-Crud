

import 'package:flutter/material.dart';
import 'package:taskapp/config/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    hintText: "Enter Your Email"),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 10),
              child: TextField(
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password ",
                    hintText: "Password"),
                obscureText: true,
              ),
            ),
            InkWell(
              onTap: () {
                _signIn();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient:
                        LinearGradient(colors: [primarycolor, secondarycolor])),
                margin: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Center(child: Text("Login With Email")),
              ),
            ),
            FlatButton(onPressed: () {}, child: Text("Singing Using Email")),
            Wrap(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: Text("Singing With Gmail")),
                FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    label: Text("Singing With phone"))
              ],
            )
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _email.text.trim();
    String pass = _password.text;

    if (email.isNotEmpty && pass.isNotEmpty) {
      _auth.signInWithEmailAndPassword(email: email, password: pass).then((user){
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Done"),
              content: Text("Singn in success"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Cancel")),
             
              ],
            );
          });
        



      })
      
      .catchError((e){
         showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("${e.message}"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Cance")),
             
              ],
            );
          });




      });

        
      
    } else {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Please provide email and password.."),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("cancel")),
                FlatButton(
                    onPressed: () {
                      _email.text = "";
                      _password.text = "";
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Ok")),
              ],
            );
          });
    }
  }
}
