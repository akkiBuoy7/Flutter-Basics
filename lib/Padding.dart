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
        title: Text("Flutter Container"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue,
              child: Text(
                "Hello World",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 50),
            color: Colors.green,
            child: Text(
              "Hello World",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Hello World",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/*
padding => provide space inside
  EdgeInsets.only() => for specific direction
  EdgeInsets.all() => for all direction
margin => provide space outside
  EdgeInsets.only() => for specific direction
  EdgeInsets.all() => for all direction
# for column or row we can provide space between children by providing
padding for each children
 */
