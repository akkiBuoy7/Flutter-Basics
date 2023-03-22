import 'package:flutter/material.dart';
void main() => runApp(EmployeeApp());
class EmployeeApp extends StatefulWidget {
  @override
  _EmployeeAppState createState() => _EmployeeAppState();
}
class _EmployeeAppState extends State<EmployeeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Employees App'),
          ),
          body: ListView(children: <Widget>[
            Center(
                child: Text(
                  'Employee List',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            DataTable(
              columns: [
                DataColumn(
                    label: Text('Id',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Name',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Designation',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('10001')),
                  DataCell(Text('Stephen')),
                  DataCell(Text('Senior Systems Engineer')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10005')),
                  DataCell(Text('John')),
                  DataCell(Text('Technology Analyst')),
                ]),
                DataRow(cells: [
                  DataCell(Text('100010')),
                  DataCell(Text('Harry')),
                  DataCell(Text('Technology Lead')),
                ]),
                DataRow(cells: [
                  DataCell(Text('10015')),
                  DataCell(Text('Peter')),
                  DataCell(Text('Project Manager')),
                ]),
              ],
            ),
          ])),
    );
  }
}
/*
In DataTable widget, you need to row and column properties to store the data.
 The columns property stores data using an array of DataColumn, and the rows
 property stores information using an array of DataRow.

The DataRow property has a sub property cells which can take an array of DataCell.
 The DataColumn has a sub-property label that takes widgets as value. We can also
 provide Text, Image, Icon, or any other widget in the DataTable.

 In DataTable widget, the headers for the columns are defined using label property
 inside the DataColumn widget.

DataRow widget creates a row inside the DataTable and each row has the column
values specified with the help of DataCell widget
 */