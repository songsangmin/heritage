import 'package:flutter/material.dart';

import 'loginpage.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
              child: Image.asset("assets/logo.png",),)
            ],
          ),
        )
      ),
    );
  }

}