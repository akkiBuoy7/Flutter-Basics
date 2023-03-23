import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {

  var _controller;
  int _selectedIndex = 0;

  @override
  void initState() {

    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("You have selected index $_selectedIndex");
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              controller: _controller,
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
            controller: _controller,
            children: [
              FirstScreen(_selectedIndex),
              SecondScreen(_selectedIndex),
              ThirdScreen(_selectedIndex)
            ],
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {

  int _selectedIndex = 0;


  FirstScreen(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'It is $_selectedIndex tab',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}

class SecondScreen extends StatelessWidget {

  int _selectedIndex = 0;


  SecondScreen(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'It is $_selectedIndex tab',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}

class ThirdScreen extends StatelessWidget {

  int _selectedIndex = 0;

  ThirdScreen(this._selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'It is $_selectedIndex tab',
        style: TextStyle(fontSize: 32.0),
      )),
    );
  }
}
