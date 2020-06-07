import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String studentname, studentid, studentprogramid;
  double studentgpa;
  getstudentname(name) {
    this.studentname = name;
  }

  getstudentId(id) {
    this.studentid = id;
  }

  getstudentprogramId(program) {
    this.studentprogramid = program;
  }

  getstudentgpa(gpa) {
    this.studentgpa = gpa;
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("Mystudents").document(studentname);

    Map<String, dynamic> students = {
      "studentName": studentname,
      "studentId": studentid,
      "studentProgramid": studentprogramid,
      "studentGPA": studentgpa,
    };
    documentReference.setData(students).whenComplete(() {
      print("$studentname created");
    });

    print("created");
  }

  readData() {
  DocumentReference documentReference=Firestore.instance.collection("Mystudents").document();
  documentReference.get().then((datasnapshot){
    print(datasnapshot.data['studentname']);


  });

    print("readed");
  }

  updateData() {
     DocumentReference documentReference =
        Firestore.instance.collection("Mystudents").document(studentname);

    Map<String, dynamic> students = {
      "studentName": studentname,
      "studentId": studentid,
      "studentProgramid": studentprogramid,
      "studentGPA": studentgpa,
    };
    documentReference.setData(students).whenComplete(() {
      print("$studentname created");
    });
    
    print("updated");
  }

  deleteData() {
      DocumentReference documentReference =
        Firestore.instance.collection("Mystudents").document(studentname);
        documentReference.delete().whenComplete((){

          print("$studentname deleted");




        });
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Firebase"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
                onChanged: (String name) {
                  getstudentname(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "student id",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
                onChanged: (String id) {
                  getstudentId(id);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Student program id",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
                onChanged: (String program) {
                  getstudentprogramId(program);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Gpa",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
                onChanged: (String gpa) {
                  getstudentgpa(gpa);
                },
              ),
            ),
            Wrap(
              // direction: Axis.horizontal,
              spacing: 6,

              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    createData();
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("create"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    readData();
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Read"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    updateData();
                  },
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("update"),
                  textColor: Colors.white,
                ),
                RaisedButton(
                  onPressed: () {
                    deleteData();
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Delte"),
                  textColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
