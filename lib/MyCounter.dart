import 'package:flutter/material.dart';
import 'package:flutter_basics/ui_helper/util.dart';

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
      home: const MyCounterPage(),
    );
  }
}

class MyCounterPage extends StatefulWidget {
  const MyCounterPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyCounterPageState();
  }
}

class _MyCounterPageState extends State<MyCounterPage> {

  int counter = 0;

  String stateTrack="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stateTrack = "Initiated";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    stateTrack = "Ended";
  }

  void _IncrementCounter(){

    counter++;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Counter Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$stateTrack",style: TextStyle(fontSize: 20),),
            Text("$counter",style: TextStyle(fontSize: 30),),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () {
                  _IncrementCounter();
                },
                child: Text("Click Here!"))
          ],
        ),
      ),
    );
  }
}
