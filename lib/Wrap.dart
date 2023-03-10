import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Wrap"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 15,
          children: [Container(
            width: 70,
            height: 70,
            color: Colors.blue,
          ),
            Container(
              width: 70,
              height: 70,
              color: Colors.grey,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.green,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.yellowAccent,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.brown,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.yellow,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.cyanAccent,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.lightBlueAccent,
            ),
            Container(
              width: 70,
              height: 70,
              color: Colors.cyan,
            ),
          ]
        ),
      )
    );
  }
}

/*
Using too many containers with row or column will lead to overflow error.
Wrap can work both as a column and row. If there is a overflow then the next item
will be shifted to next row or next column

# Always better to use wrap within a container

  direction: Axis.horizontal/Axis.vertical
  spacing: along the main direction,
  runSpacing: along cross direction,

 */