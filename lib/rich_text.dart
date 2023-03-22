import 'package:flutter/gestures.dart';
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
      body: RichText(
        text: TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              color: Colors.black,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap=(){
                  print("Signup clicked");
                  },
                  text: 'Signup',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ))
            ]),
      ),
    );
  }
}


/*
RichText can help to create sentence with text of different styles together

For providing click on text span
 */
// recognizer: TapGestureRecognizer()
// ..onTap=(){
// print("Signup clicked");
// }