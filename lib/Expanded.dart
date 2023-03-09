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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.red, height: 100, width: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 50,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                      child: Container(
                        color: Colors.yellow,
                        width: 50,
                        height: 100,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                      width: 50,
                    ),
                  ),
                ),
                Container(color: Colors.red, height: 100, width: 50),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.green,
                      height: 100,
                      width: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.yellow,
                    width: 50,
                    height: 100,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 50,
                  ),
                ),
                Expanded(child: Container(color: Colors.red, height: 100, width: 50)),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    width: 50,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.yellow,
                    width: 50,
                    height: 100,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      height: 100,
                    ),
                  ),
                  Expanded(child: Container(color: Colors.red, height: 100)),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      height: 100,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.yellow,
                      height: 100,
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

/*
# if we don't mention height or width of container it will occupy whole screen
# if we want to occupy a empty space in the screen with a layout use Expanded
# Expanded mostly useful with column and rows.
# Expanded will expand the widget along the main axis direction of column or row
# Expanded
   flex : will provide ratio of the layouts
# if we provide padding to children of row or column , then we need to use Expanded
with the padding and not with the children (Like row 1 and row 2)

 */
