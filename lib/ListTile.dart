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
  var arrNames = ["Sachin", "Dhoni", "Kohli", "Ganguly", "Jadeja", "Ashwin"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Container"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/ic_boy.png'),
                backgroundColor: Colors.black,
              ),
              title: Text(arrNames[index],
                  style: const TextStyle(fontFamily: 'CustomFont')),
              subtitle: Text(arrNames[index]),
              trailing: const Icon(Icons.add),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 10,
            );
          },
          itemCount: arrNames.length),
    );
  }
}
