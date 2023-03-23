import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              indicator: BoxDecoration(
                // custom indicator
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
              ),
              //indicatorColor: Colors.black,
              //indicatorWeight: 5,
              indicatorPadding: EdgeInsets.all(5),
              tabs: [
                Tab(icon: Icon(Icons.add_a_photo)),
                Tab(icon: Icon(Icons.access_time_filled)),
                Tab(icon: Icon(Icons.settings)),
              ],
              labelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 10),
              labelPadding: EdgeInsets.all(5),
              unselectedLabelColor: Colors.white,
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen()
            ],
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'It is first tab',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'It is second tab',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'It is third tab',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}
