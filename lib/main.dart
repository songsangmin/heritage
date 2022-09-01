import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/pages/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Great Heritage',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: HomePage(),
    );
  }

}