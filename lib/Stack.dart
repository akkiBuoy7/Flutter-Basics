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
        title: Text("Stack"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 300,
                height: 200,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text("3",style: customTextstyle(),),
                ),
                color: Colors.lightBlue,
              ),
              Container(width: 200,
              height: 200,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text("2",style: customTextstyle(),),
              ),
              color: Colors.lightGreenAccent,),
              Container(width: 100,
                height: 100,
                child: Center(child: Text("1",style: customTextstyle(),)),
                color: Colors.lightBlueAccent,)
            ],
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              Container(
                width: 300,
                height: 200,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text("3",style: customTextstyle(),),
                ),
                color: Colors.lightBlue,
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                top: 20,
                child: Container(width: 200,
                  height: 200,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text("2",style: customTextstyle(),),
                  ),
                  color: Colors.lightGreenAccent,),
              ),
              Positioned(
                right: 30,
                left: 35,
                bottom: 35,
                top: 35,
                child: Container(width: 50,
                  height: 50,
                  child: Center(child: Text("1",style: customTextstyle(),)),
                  color: Colors.lightBlueAccent,),
              )
            ],
          )
        ],
      )
    );
  }
}

/*
Stack is mainly used for overlay design
 # Positioned => It is useful to provide offsets to children in stack
 */