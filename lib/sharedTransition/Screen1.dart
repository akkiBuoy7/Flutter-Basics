import 'package:flutter/material.dart';
import 'package:flutter_basics/sharedTransition/Screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyScreen1(),
    );
  }
}

class MyScreen1 extends StatefulWidget {
  const MyScreen1({Key? key}) : super(key: key);

  @override
  State<MyScreen1> createState() => _MyScreen1State();
}

class _MyScreen1State extends State<MyScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Screen 1"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MyScreen2()));
            },
            child: Hero(
                tag: "ic_boy", child: Image.asset('assets/images/ic_boy.png')),
          ),
        ),
      ),
    );
  }
}
/*
Hero => Similar to sharedtransition in Native
   # tag : name the widget
 */