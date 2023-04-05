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
  String _status = "";

  @override
  void initState() {

    /*
    Listen to custom stream method
    Update the UI after event is listened
     */
    getDummyProgress().listen((event) {
      setState(() {
        _counter = event;
        print(event);
      });
    },onError: (err){
      print(err.toString());
      setState(() {
        //_status = err;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Stream"),
      ),
      body: Center(
        child: Text(
          "$_counter : Status: $_status",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /*
  Custom Stream creation.
  need to use async* while using stream
  yield => will return multiple times from stream
   */
  Stream<int> getDummyProgress() async* {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      yield i;
    }
    throw Exception("Completed !");
  }
}
