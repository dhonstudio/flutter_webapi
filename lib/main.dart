// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_webapi/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web API',
      initialRoute: '/', // route yang dibuka pertama kali
      routes: {
        '/': (context) => HomePage(),
        // '/details': (context) => DetailsPage(),
      },
    );
  }
}
