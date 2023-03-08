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
      body: Align(
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
              child: Column(
                children: [
                  TextButton(
                    child: Text("Click Here!"),
                    onPressed: () {
                      print("Single tap");
                    },
                    onLongPress: () {
                      print("Long Tap");
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Elevate button pressed");
                      },
                      onLongPress: () {
                        print("Elevate button long pressed");
                      },
                      child: Text('Elevated Button')),
                  OutlinedButton(
                      onPressed: () {
                        print("Outlined clicked");
                      },
                      child: Text("Outlined Button"))
                ],
              ),
            ),
            Container(
              color: Colors.red,
              width: 200,
              height: 200,
              child: Center(child: Image.asset("assets/images/flutter_widgets.jpg")),
            )
          ],
        ),
      ),
    );
  }
}
