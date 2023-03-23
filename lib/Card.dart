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
        title: Text("Flutter Container"),
      ),
      body: Column(
        children: [
          Center(
            child: Card(
                elevation: 15,
                shadowColor: Colors.blue,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hello World!!!",
                    style: customTextstyle(fontSize: 18.0),
                  ),
                )),
          ),
          Card(
            elevation: 10,
            margin: EdgeInsets.all(5),
            shadowColor: Colors.blue.shade200,
            color: Colors.grey.shade200,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.orange.shade300, width: 3),
            ),
            child: ListTile(
              title: Text("Hello Employee"),
            ),
          ),
          Card(
            elevation: 8,
            margin: EdgeInsets.all(10),
            child: Container(
              height: 150,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset("assets/images/ic_boy.png"),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("John Doe"),
                            subtitle: Text("Senior Full Stack Developer"),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(child: Text("EDIT"), onPressed: () {}),
                              SizedBox(width: 8),
                              TextButton(child: Text("DELETE"), onPressed: () {}),
                              SizedBox(width: 8)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
