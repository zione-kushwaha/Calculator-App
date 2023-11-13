import 'dart:async';

import 'package:calculator/main.dart';
import 'package:flutter/material.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return myhomepage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Text(
          'ziiione',
          style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.w800),
        )),
      ),
    );
  }
}
