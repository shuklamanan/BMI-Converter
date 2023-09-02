import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_bmi/main.dart';

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Body-Mass Index Converter',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          color: Colors.blue.shade500,
        ),
      ),
    );
  }
}
