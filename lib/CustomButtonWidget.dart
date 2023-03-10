import 'package:flutter/material.dart';
import 'package:flutter_basics/widgets/RoundedButton.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                child: RoundedButton(btnName: "Button 1", icon: Icon(Icons.email),
                    callback: (){
                  print("Button 1 Clicked");
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                child: RoundedButton(btnName: "Button 2", icon: Icon(Icons.phone),
                    color: Colors.yellow,
                    textStyle: TextStyle(color: Colors.black),
                    callback: (){
                      print("Button 1 Clicked");
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 200,
                height: 50,
                child: RoundedButton(btnName: "Button 3", icon: Icon(Icons.password),
                    color: Colors.lightBlueAccent,
                    callback: (){
                      print("Button 1 Clicked");
                    }),
              ),
            ),
          ),
        ],
      )
    );
  }
}
/*
RoundedButton => It is the custom widget class
 */