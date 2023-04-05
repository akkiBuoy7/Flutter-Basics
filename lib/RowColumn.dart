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
 spaceAround -> padding between equal and remaining space is divided by 2 for the ends
 spaceEvenly -> equally divided across width or length of axis at both ends also
 spaceBetween -> no padding at ends
 */

/*
Column arranges vertically
main_axis -> vertical
cross axis -> Horizontal
MainAxisAlignment -> can change alignment left or right
 spaceAround -> padding between equal and remaining space is divided by 2 for the ends
 spaceEvenly -> equally divided across width or length of axis at both ends also
 spaceBetween -> no padding at ends
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

/*
we can align the child widgets inside the Row Widget, along main Axis as well as
 cross Axis. For aligning along the main Axis, you need to use the property mainAxisAlignment.
 The value possible values for mainAxisAlignment are start, center, end, spaceAround, spaceBetween and spaceEvenly.
 To specify any of these values for mainAxisAlignment, you need to use MainAxisAlignment object. (for example:- MainAxisAlignment.start)

If you do not provide a value for mainAxisAlignment, it uses the default value as start

start: it places the children widgets closer to the start of main axis

end: it places the children widgets closer to the end of main axis

center: it places the children widgets closer the center of main axis

spaceAround: it places the free space evenly between the children as well as half of that space before and after the first and last child

spaceBetween: it places the free space between evenly between the children

spaceEvenly: it places the free space evenly between the children as well as before and after the first and last child
 */

/*
Aligning the Child Widgets along cross Axis
For aligning along the cross Axis i.e., vertically in case of Row widgets, you need to use the property crossAxisAlignment. The value possible values for crossAxisAlignment are start, center, end, stretch. To specify any of these values for crossAxisAlignment, you need to use CrossAxisAlignment object.

for example:- CrossAxisAlignment.start

If you do not provide a value for crossAxisAlignment, it uses the default value as center

start - It places the children widgets closest to the start of cross axis

end -  It places the children widgets closest to the end of cross axis

center - It places the children widgets in the middle of the cross axis

stretch - It will require the children widgets to fill the cross axis
 */

/*
mainAxisSize – This will by default set the total free space along the main axis to the maximum value possible. This means the child widgets will as wide as possible. To make it narrow, you can set the mainAxisSize value to min.
textDirection – By default the text content is displayed from left to right direction. You can also change this direction of text by using the textDecoration option with a value set as rtl.
 */
