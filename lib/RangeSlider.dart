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
    return RangeSliderUi();
  }
}

class RangeSliderUi extends StatefulWidget {
  @override
  State<RangeSliderUi> createState() => _RangeSliderUiState();
}

class _RangeSliderUiState extends State<RangeSliderUi> {
  RangeValues rangeValues = RangeValues(0, 100);
  RangeValues? selectedValue;

  @override
  Widget build(BuildContext context) {
    RangeLabels rangeLabels =
        RangeLabels(rangeValues.start.toString(), rangeValues.end.toString());

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
            RangeSlider(
                values: rangeValues,
                labels: rangeLabels,
                divisions: 10,
                min: 0,
                max: 100,
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.shade50,
                onChanged: (newValue) {
                  rangeValues = newValue;
                  selectedValue = newValue;
                  print("start ${newValue.start}  end ${newValue.end}");
                  setState(() {
                  });
                })
          ,
          Text("start ${selectedValue?.start}  end ${selectedValue?.end}")],
        ),
      ),
    );
    ;
  }
}
