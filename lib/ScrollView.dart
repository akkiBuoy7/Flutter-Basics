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
      body: Padding( // padding the container
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.yellow,
                          margin: const EdgeInsets.all(8),
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.red,
                          margin: const EdgeInsets.all(8),
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.blue,
                          margin: const EdgeInsets.all(8),
                        ),
                      ],
                    ),
                  ),
                ),

              Container(
                height: 200,
                color: Colors.blue,
                margin: const EdgeInsets.all(8),
              ),
              Container(
                height: 200,
                color: Colors.blue,
                margin: const EdgeInsets.all(8),
              ),
              Container(
                height: 200,
                color: Colors.blue,
                margin: const EdgeInsets.all(8),
              ),
              Container(
                height: 200,
                color: Colors.blue,
                margin: const EdgeInsets.all(8),
              ),
              Container(
                height: 200,
                color: Colors.blue,
                margin: const EdgeInsets.all(8),
              ),
            ],
          ),
        ),
      )
    );
  }
}

/*
SingleChildScrollView => Helps in creating scroll view
and also eliminates render overflow error
   :scrollDirection => sets the direction of scroll
 */