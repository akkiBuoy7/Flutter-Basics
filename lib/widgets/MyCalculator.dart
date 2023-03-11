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
      home: MyCalcPage(),
    );
  }
}

class MyCalcPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCalcPageState();
  }
}

class _MyCalcPageState extends State<MyCalcPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Calc"),
      ),
      body: CalcUi(), // using the stateful widget here in stateful page
    );
  }
}

/* Here we created a Custom Stateful widget for updating state on button click
Instead of directly creating it in the Ui page , here we made it reusable
 */

class CalcUi extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CalcUiState();
  }
}

class _CalcUiState extends State<CalcUi>{

  int? valOne;
  int? valTwo;
  int? result;
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(color: Colors.blue, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(color: Colors.grey, width: 2)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller2,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(color: Colors.blue, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(color: Colors.grey, width: 2)),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              valOne = int.parse(controller1.text.toString());
              valTwo = int.parse(controller2.text.toString());
              result = valOne! + valTwo!;
              print("*********$valOne");
              setState(() {

              });
            }, child: Text("Add")),
            ElevatedButton(onPressed: () {
              valOne = int.parse(controller1.text.toString());
              valTwo = int.parse(controller2.text.toString());
              result = valOne! - valTwo!;
              setState(() {

              });
            }, child: Text("Sub")),
            ElevatedButton(onPressed: () {
              valOne = int.parse(controller1.text.toString());
              valTwo = int.parse(controller2.text.toString());
              result = valOne! * valTwo!;
              setState(() {

              });
            }, child: Text("Mul")),
            ElevatedButton(onPressed: () {
              valOne = int.parse(controller1.text.toString());
              valTwo = int.parse(controller2.text.toString());
              result = (valOne! / valTwo!) as int?;
              setState(() {

              });
            }, child: Text("Div")),
          ],
        ),
        Text("For $valOne and $valTwo answer is $result")
      ],
    );;
  }
}
