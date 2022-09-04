import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/pages/homepage.dart';
import 'package:heritage/pages/loginpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


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
      home: const LoginPage(),
    );
  }

}