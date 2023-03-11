import 'package:flutter/material.dart';

import 'Screen1.dart';

class MyScreen2 extends StatefulWidget {
  const MyScreen2({Key? key}) : super(key: key);

  @override
  State<MyScreen2> createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Screen2"),
      ),
      body:  Container(
        height: 400,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyScreen1()));
          },
          child: Hero(
              tag: "ic_boy", child: Image.asset('assets/images/ic_boy.png')),
        ),
      ),
    );
  }
}