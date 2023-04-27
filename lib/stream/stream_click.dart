import 'dart:async';

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
  int _counter = 0;
  StreamController<int> streamController = StreamController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.white,),
            onPressed: () {
          _counter++;
          streamController.sink.add(_counter);
        }),
        appBar: AppBar(
          title: Text("Flutter Container"),
        ),
        body: Center(
          child: StreamBuilder(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "$_counter",
                    style: TextStyle(fontSize: 70),
                  );
                } else
                  return Text(
                    "loading. . .",
                    style: TextStyle(fontSize: 70),
                  );
              }),
        ));
  }
}

/*
StreamController :  class to create streams
streamController.sink : used to add event to stream using add method
streamController.stream : gives output from the stream only once.Can be listened only once
streamController.stream.asBroadcastStream() : gives output from the.Can be listened only multiple times
streamController.stream.listen((event) {} : subscribe to stream events
StreamBuilder: subscribe to stream events and can update UI with builder
 */
