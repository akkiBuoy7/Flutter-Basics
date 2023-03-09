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

/*
Row arranges horizontally
main_axis -> Horizontal
cross axis -> vertical
MainAxisAlignment -> can change alignment left or right
 spaceAround -> padding at both ends are equal
 spaceEvenly -> equally divided across width or length of axis
 spaceBetween -> no padding
 */

/*
Column arranges vertically
main_axis -> vertical
cross axis -> Horizontal
MainAxisAlignment -> can change alignment left or right
 spaceAround -> padding at both ends are equal
 spaceEvenly -> equally divided across width or length of axis
 spaceBetween -> no padding
 */

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
          Container(
            color: Colors.lightGreen,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Some text 1"),
                Text("Some Text 2"),
                TextButton(onPressed: () {}, child: Text("Click here!")),
                ElevatedButton(onPressed: () {}, child: Text("Click Here!"))
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Some text 1",
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Some Text 2",
                  textAlign: TextAlign.center,
                ),
                TextButton(onPressed: () {}, child: Text("Click here!")),
                ElevatedButton(onPressed: () {}, child: Text("Click Here!")),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Again text 1"),
                      Text("Again Text 2"),
                      TextButton(
                          onPressed: () {}, child: Text("Again Click here!")),
                      ElevatedButton(
                          onPressed: () {}, child: Text("Click Here!")),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Some text 1",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Some Text 2",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Some Text 3",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
