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
      body: Center(
        child: InkWell(
          onTap: () {
            print("Container tapped");
          },
          onDoubleTap: () {
            print("Container double tapped");
          },
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Center(
                child: InkWell(
                  onTap: (){
                    print("Text tapped");
                  },
                  onDoubleTap: (){
                    print("Text double tapped");
                  },
                  child: Text(
              "Click Here!",
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19),
            ),
                )),
          ),
        ),
      ),
    );
  }
}

/*
InkWell is used to provide click action on any kind of widget
 */
