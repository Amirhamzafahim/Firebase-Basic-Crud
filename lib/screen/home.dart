import 'package:flutter/material.dart';
import 'package:taskapp/config/config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _taskcontolar = TextEditingController();

  final Firestore _db = Firestore.instance; //1st step

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100),
        child: StreamBuilder(
            stream: _db
                .collection("users")
                .orderBy("Date", descending: true)
                .snapshots(),//todo snapshots eta diye ki bujaise
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {//todo eikane Qurerysnapshot diye ki bujaise
              if (snapshot.hasData) {
                return ListView(
                    children: snapshot.data.documents.map((snap) {
                  return ListTile(
                    title: Text(snap.data["task"]),
                    trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _db
                              .collection("users")
                              .document(snap.documentID)
                              .delete();
                        }),
                  );
                }).toList());
              }

              return Center(
                child: Text("data"),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showtask();
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        elevation: 4,
        backgroundColor: primarycolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max, //eta iphone jnno use kra lgbe
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: null),
            IconButton(icon: Icon(Icons.person_outline), onPressed: null)
          ],
        ),
      ),
    );
  }

  void _showtask() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Add Task"),
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: _taskcontolar,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Task name",
                        hintText: "Write your task name"),
                  )),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel")),
                    RaisedButton(
                        color: primarycolor,
                        onPressed: () {
                          String task = _taskcontolar.text
                              .trim(); //function mddhe jkn filed kaj krbo tkn akta variable rhkbo
                          Navigator.of(context)
                              .pop(); //eta use krsi karonjkn data add krbe tkn nije nije chole jabe
                          print(task);
                          _db.collection("users").add({
                            "task": task,
                            "Date": DateTime.now(),
                          });
                        },
                        child: Text("Add")),
                  ],
                ),
              )
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          );
        });
  }
}
