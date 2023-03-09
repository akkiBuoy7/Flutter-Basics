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
          textTheme: const TextTheme(
              displayLarge:
                  TextStyle(fontSize: 21, fontWeight: FontWeight.w900,
                  color: Colors.yellow),
              displayMedium:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w700,
                  color: Colors.red),
              displaySmall:
                  TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
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
          backgroundColor: Colors.blue,
          // Changing ap bar color of a screen
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Flutter Container"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Big Text",
                  style: Theme.of(context).textTheme.displayLarge),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Medium Text",
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Small Text",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("Custom Text Style",
                  style: customTextstyle(
                      textColor: Colors.blue, fontStyle: FontStyle.italic)),
            )
          ],
        ));
  }
}

/*
# Static way => Declare textStyle in Material App.
Access the theme in Text widget Theme.of(context).textTheme.<ThemeName>
# Dynamic way => Declare a util class in ui_helper package
Create a method that return TextStyle widget.
Keep named params in method for optional args
 */
