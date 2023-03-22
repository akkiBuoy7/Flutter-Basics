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
/*
Table widget will automatically decide the column width by equally dividing
between the TableCell’s. If it is not equally divided, it will throw an error
saying “TableRow in a Table must have the same number of children so that every
 cell is filled, otherwise the table will be having holes”

Each table row will always have the same height which is equal to the maximum
height of a Table Cell.

A table can have only TableRow as the children widgets

defaultVerticalAlignment:

This property takes TableCellVerticalAlignment enum as parameter value and aligns
the cells vertically in the table. Some of the values that it can take are middle,
top, bottom, fill and so on.

textBaseline:

This property takes TextBaseline enum as parameter. Using this property, you can
 specify a horizontal line to align the text on the screen inside the Table widget.

textDirection:

This property works similar to reverse property of GridView. It can be used to
arrange the columns in left to right or right to left direction. The default value is ltr but can also be set to rtl.
 */