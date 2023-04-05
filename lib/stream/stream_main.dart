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

  late StreamController myStreamController = StreamController();
  late Stream myStream = myStreamController.stream;
  late Stream myBroadcastStream = myStreamController.stream.asBroadcastStream();
  late StreamSubscription mySubscription;
  int _counter  = 0;
  int _incrementer = 0;

  @override
  void initState() {
    // TODO: implement initState

    /*
    Can not use simple stream to listen more than twice. It will give error.
    Can listen only once
     */
    // mySubscription = myStream.listen((event) {
    //   print("****** Stream Subscription >>>  $event ***************");
    // });
    //
    // myStream.listen((event) {
    //   print("****** Stream Subscription again >>>  $event ***************");
    // });

    /*
    Broadcast stream can be listened as many times as we want
     */
    // myBroadcastStream.listen((event) {
    //   print("****** Broadcast Stream Subscription  >>>  $event ***************");
    // });
    //
    // myBroadcastStream.listen((event) {
    //   print("****** Broadcast Stream Subscription again >>>  $event ***************");
    // });
    //


    /*
    Subscriber
    Updating the UI after stream event is listened
     */
    myBroadcastStream.listen((event) {
      setState(() {
        _counter=event;
      });
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Container"),
      ),
      body: Center(
        child: Text(
          "${_counter}",
          style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementer++;
          myStreamController.sink.add(_incrementer);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
