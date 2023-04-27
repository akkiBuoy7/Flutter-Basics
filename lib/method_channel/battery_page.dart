import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({Key? key}) : super(key: key);

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  String _batteryLevel = "Waiting";

  // create a method channel can be used in both android or iOS
  static const platform = MethodChannel('samples.flutter.dev/battery');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battery Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${_batteryLevel}",
                style: TextStyle(fontSize: 23),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: _getBatteryLevel, child: Text("Get Battery Level")),
              )
            ],
          ),
        ),
      ),
    );
  }


  Future<void> _getBatteryLevel() async {
    String resultReceived;
    // can send args from flutter to native in the form of Map
    final arguments = {"name": "Android"};
    try {
      // invoke the native method through method channel
      // use a method name
      final result = await platform.invokeMethod('getBatteryLevel',arguments);
      resultReceived = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      resultReceived = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = resultReceived;
    });
  }
}
/*
To make changes in native code:

 Use flutter clean to delete build folder
 Use pub.get() to build the folder
 Then go to android folder => Flutter > open Android module in Android Studio
 */