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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder"),
      ),
      body: Center(
          child: StreamBuilder(
              stream: getDummyProgress(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "$_counter",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    "${snapshot.error.toString()}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                } else
                  return Text(
                    "Loading",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
              })),
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
      _counter = i;
      yield _counter;
    }
    throw Exception("Completed !");
  }

  /*
  Subscriber
  Stream builder receives two params:
    stream: It receives a stream that is continuously yielding events
    builder: It is used to return the UI using the event returned from
              stream

    if we use stream builder then no need to use the set state method
    for updating the UI. Stream builder itself handles it.
   */
}
