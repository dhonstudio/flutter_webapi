// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_webapi/models/student.dart';
import 'package:flutter_webapi/pages/editpage.dart';

class DetailsPage extends StatefulWidget {
  late final Student student;

  DetailsPage({required this.student});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Details'),
      ),
      body: Container(
        height: 280.0,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // isi dari detail: name, age, email, phone
            Text(
              "Name : ${widget.student.name}",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
            Text(
              "Age : ${widget.student.age}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
            Text(
              "Email : ${widget.student.email}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
            Text(
              "Phone : ${widget.student.phone}",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                12.0,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EditPage(
                    student: widget.student,
                  )));
        },
      ),
    );
  }
}
