import 'package:flutter/material.dart';
import 'package:flutter_basics/ui_helper/util.dart';
import 'package:intl/intl.dart';

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
  var time = DateTime.now();
  var format = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Container"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CurrentTime:${DateFormat(format).format(time)}",
              style: customTextstyle(),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  format = 'Hms';
                  setState(() {});
                },
                child: Text("Get Time")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2022),
                      lastDate: DateTime(2024));

                  if (datePicked != null) {
                    print("${datePicked.day}");
                  }
                },
                child: Text("Date Picker")),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Future<TimeOfDay?> pickedTime = showTimePicker(context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input);

                  if(pickedTime!=null){
                    int? v = 0;
                    pickedTime.then((value) => v=value?.hour);
                    print("************$v");
                  }
                },
                child: Text("Time Picker")),
          ],
        ),
      ),
    );
  }
}
/*
need to use intl library in pubs file to use DateFormat class""
 */
