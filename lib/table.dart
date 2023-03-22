import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Table Widget'),
          ),
          body: Center(
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                    defaultColumnWidth: FixedColumnWidth(120.0),
                    // border: TableBorder.all(
                    //     color: Colors.black, style: BorderStyle.solid, width: 1),
                    children: [
                      TableRow(children: [
                        TableCell(
                            child: Center(
                                child: Text('Organization',
                                    style: TextStyle(fontSize: 20.0)))),
                        TableCell(
                            child: Center(
                                child: Text('Framework',
                                    style: TextStyle(fontSize: 20.0)))),
                        TableCell(
                            child: Center(
                                child: Text('Review',
                                    style: TextStyle(fontSize: 20.0)))),
                      ]),
                      TableRow(children: [
                        TableCell(child: Center(child: Text('Google'))),
                        TableCell(child: Center(child: Text('Flutter'))),
                        TableCell(child: Center(child: Text('5*'))),
                      ]),
                      TableRow(children: [
                        TableCell(child: Center(child: Text('Facebook'))),
                        TableCell(child: Center(child: Text('React Native'))),
                        TableCell(child: Center(child: Text('5*'))),
                      ]),
                      TableRow(children: [
                        TableCell(child: Center(child: Text('Ionic'))),
                        TableCell(child: Center(child: Text('Ionic'))),
                        TableCell(child: Center(child: Text('5*'))),
                      ]),
                    ],
                  ),
                ),
              ]))),
    );
  }
}
