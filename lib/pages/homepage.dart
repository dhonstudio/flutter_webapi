// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webapi/models/student.dart';
import 'package:flutter_webapi/nameprefix.dart';
import 'package:flutter_webapi/pages/detailspage.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
    # Flutter menyediakan Widget yang digunakan untuk komunikasi dengan web API, disebut dengan Future
    # Flutter harus mengenali dulu, data yang ingin ditampilkan berisi apa saja
      - Design pattern MVC: Model digunakan untuk menghandle database
  */

  late Future<List<Student>> students;
  final studentListKey = GlobalKey<_HomePageState>();

  //inisialisasi nilai awal
  @override
  void initState() {
    super.initState();
    students = getStudentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentListKey,
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: Center(
        child: FutureBuilder<List<Student>>(
          future: students,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // menampilkan loading
            if (!snapshot.hasData) return CircularProgressIndicator();
            // data ada dan ditemukan kemudian ditampilkan
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.person_outline_outlined),
                      trailing: Icon(Icons.view_list),
                      title: Text(
                        data.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // membuka details dari student
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailsPage(student: data)));
                      },
                    ),
                  );
                });
          },
        ),
      ),
    );
  }

  /*
    # Asynchronous:
      - banyak function bisa dijalankan secara bersamaan
        function mana yang selesai lebih dahulu tidak diketahui
      - mengatasi async: Callback, Promise, async await
  */
  Future<List<Student>> getStudentList() async {
    final url = '${NamePrefix.URL_PREFIX}/list.php';
    final response = await http.get(Uri.parse(url));

    final items = json.decode(response.body).cast<Map<String, dynamic>>();
    print(items);

    // mengubah item ke dalam bentuk Lists
    List<Student> students = items.map<Student>((json) {
      return Student.fromJson(json);
    }).toList();

    return students;
  }
}
