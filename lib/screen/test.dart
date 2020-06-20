import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskapp/config/config.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
   final TextEditingController _taskcontolar1 = TextEditingController();
    final TextEditingController _taskcontolar2 = TextEditingController();
     final Firestore _db = Firestore.instance; //1st step

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: Column(
          children: <Widget>[
            TextField(
                    controller: _taskcontolar1,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                    
                        hintText: "First name"),
                  ),
                   TextField(
                    controller: _taskcontolar2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                    
                        hintText: "last name"),
                  ),
                    RaisedButton(
                        color: primarycolor,
                        onPressed: () {
                         String task = _taskcontolar1.text
                              .trim();
                               String task2 = _taskcontolar2.text
                              .trim();//function mddhe jkn filed kaj krbo tkn akta variable rhkbo
                          // Navigator.of(context)
                          //     .pop(); //eta use krsi karonjkn data add krbe tkn nije nije chole jabe
                       print(task);
                       print(task2);
                          // _db.collection("users").add({
                          //   "task": task,
                          //   "Date": DateTime.now(),
                          // });
                        },
                        child: Text("Add")),




          ],



        ),



      ),
      
    );
  }
}