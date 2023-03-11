import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics/demoNavigation/Login.dart';
import 'package:flutter_basics/ui_helper/util.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashUi();
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
}

class SplashUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Splash",
            style: customTextstyle(textColor: Colors.white, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
