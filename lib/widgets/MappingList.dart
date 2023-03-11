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
  var dataList = [
    {'name ': 'Akash', 'mb': '123456789', 'unread': '1'},
    {'name ': 'Rohit', 'mb': '654631321', 'unread': '1'},
    {'name ': 'Sachin', 'mb': '131634046', 'unread': '10'},
    {'name ': 'Kohli', 'mb': '123465179', 'unread': '7'},
    {'name ': 'Jaddu', 'mb': '7687513', 'unread': '11'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Container"),
      ),
      body: ListView(
        children: dataList
            .map((data) => ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text(data['name '].toString()),
                  subtitle: Text(data['mb'].toString()),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    child: Center(child: Text(data['unread'].toString())),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

/*
ListView(
children : myList.map((item) => Container(
child : Text(item['key'].toString()))))
 */
