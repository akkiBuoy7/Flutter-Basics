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
      body: Column(
        children: [
          SizedBox.square(
            dimension: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Click"),
            ),
          ),
          SizedBox(height: 25,),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 50, minHeight: 20, maxWidth: 150, minWidth: 100),
              child: SizedBox.expand(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Click again"),
                ),
              )),
          SizedBox(height: 25,),
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 50, minHeight: 20, maxWidth: 150, minWidth: 100),
              child: SizedBox.shrink(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Click again"),
                ),
              )),
        ],
      ),
    );
  }
}
/*
SizedBox is useful when we want to give only size to a widget
When we want to give margin between widgets which don't have in built margin param
SizedBox.expand => will occupy maxDimension of parent
SizedBox.shrink => will occupy minDimension of parent
 */
