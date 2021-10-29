// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_webapi/models/student.dart';
import 'package:flutter_webapi/nameprefix.dart';
import 'package:flutter_webapi/pages/editpage.dart';

import 'package:http/http.dart' as http;

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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _deleteStudent(context);
            },
            icon: Icon(Icons.delete),
          )
        ],
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

  void _deleteStudent(context) async {
    await deletestudent();

    //redirect
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  Future deletestudent() async {
    final url = '${NamePrefix.URL_PREFIX}/delete.php';
    return await http.post(Uri.parse(url), body: {
      'id': widget.student.id.toString(),
    });
  }
}
