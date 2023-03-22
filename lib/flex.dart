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
      body: ListView(
        children: [Flex(
          direction: Axis.vertical,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.amberAccent,
              child: Text(
                "Container 1",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.orangeAccent,
              child: Text(
                "Container 2",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.redAccent,
              child: Text(
                "Container 3",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
          SizedBox(height: 50,),
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.amberAccent,
                child: Text(
                  "Container 1",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors.orangeAccent,
                child: Text(
                  "Container 2",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors.redAccent,
                child: Text(
                  "Container 3",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ]
      ),

    );
  }
}