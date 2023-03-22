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
      body: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              child: Column(
                children: [
                  TextButton(
                    child: Text("Click Here!"),
                    style: TextButton.styleFrom(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        shadowColor: Colors.green,
                        elevation: 10,
                        textStyle: TextStyle(fontWeight: FontWeight.bold),
                        disabledForegroundColor: Colors.red.withOpacity(0.38)),
                    onPressed: () {
                      print("Single tap");
                    },
                    onLongPress: () {
                      print("Long Tap");
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Elevate button pressed");
                      },
                      onLongPress: () {
                        print("Elevate button long pressed");
                      },
                      child: Text('Elevated Button')),
                  OutlinedButton(
                      onPressed: () {
                        print("Outlined clicked");
                      },
                      child: Text("Outlined Button")),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.ac_unit,
                      color: Colors.red,
                    ),
                    backgroundColor: Colors.yellow,
                  ),
                  IconButton(
                      onPressed: () {},
                      color: Colors.black,
                      tooltip: "increase volume",
                      icon: Icon(
                        Icons.volume_down,
                        color: Colors.red,
                      )),
                  PopupMenuButton(
                    elevation: 3.2,
                    initialValue: 'Log in',
                    onCanceled: () {},
                    tooltip: 'Pop up menu button',
                    onSelected: (data) {
                      print(data);
                    },
                    itemBuilder: (context) {
                      return ['Log in', 'About Us', 'User Profile']
                          .map((choice) {
                        return PopupMenuItem(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  )
                ],
              ),
            ),
            Container(
              color: Colors.red,
              width: 200,
              child: Center(
                  child: Image.asset("assets/images/flutter_widgets.jpg")),
            )
          ],
        ),
      ),
    );
  }
}
/*
PopUpMenuButton:
Itembuilder :  will return a list of popupmenuItems
onSelected: On selecting any of the popupmenuItems the value will be received
            in the onSelected method and we can do routing here based on value
 */
