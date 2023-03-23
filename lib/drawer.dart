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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Container"),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'My First App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.account_box),
              onTap: () {
                print("right drawer");
                toggleRightDrawer();
              },
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text("My Orders"),
            ),
            ListTile(
              title: Text("About Us"),
            ),
            ListTile(
              title: Text("Contact Us"),
            ),
          ],
        ),
      ),
      body: Column(children: [
        Container(
          color: Colors.redAccent,
          width: 100,
          height: 100,
        )
      ]),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'My First App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.account_box),
              onTap: () {
                toggleLeftDrawer();
              },
            ),
            Divider(
              height: 0.2,
            ),
            ListTile(
              title: Text("My Orders"),
            ),
            ListTile(
              title: Text("About Us"),
            ),
            ListTile(
              title: Text("Contact Us"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  // for left drawer
  toggleLeftDrawer() async {
    if (_scaffoldKey.currentState?.isDrawerOpen == true) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }

  // for right drawer
  toggleRightDrawer() async {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    } else {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }
}
