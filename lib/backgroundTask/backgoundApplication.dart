import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyBackGroundApp());
}

class MyBackGroundApp extends StatelessWidget {
  const MyBackGroundApp({super.key});

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
  List<Widget> widgetArr = [
    Text(
      'Widget One',
      textScaleFactor: 2,
    ),
    Text(
      'Widget Two',
      textScaleFactor: 2,
    ),
  ];

  final stopWatch = Stopwatch();

  @override
  void initState() {
    super.initState();
    stopWatch.start();
    getNetworkAssetAsync2();
    //getNetworkAssetAsync2();
  }

  //case 1 *********************SYNCHRONOUS******************************
  /*
  It is a simple synchronous call to add image.
  The image addition is delayed
  so the widget 3 will be added after that
   */
  getNetworkAsset() {
    /*
    Synchronous call
    get Network Asset start - 0
    Images Added 5
    Text Added 5
     */
    print("get Network Asset start - ${stopWatch.elapsed.inSeconds}");

    sleep(Duration(seconds: 5));
    setState(() {
      widgetArr.insert(1, Image.asset("assets/images/ic_boy.png"));
    });

    print("Images Added ${stopWatch.elapsed.inSeconds}");

    setState(() {
      widgetArr.insert(
          1,
          Text(
            "Widget Three",
            textScaleFactor: 2,
          ));
    });

    print("Text Added ${stopWatch.elapsed.inSeconds}");
  }

  //case 2 *********************ASYNCHRONOUS******************************
  /*
  It is a simple asynchronous call to add image.
  The image addition is not delayed
  so the widget 3 will be added instantly even before image
   */
  getNetworkAssetAsync() {
    // thread is  not blocked
    /*
    ASynchronous call
    get Network Asset Delay start - 0
    Text Added 0
    Images Added 5
     */
    print("get Network Asset start - ${stopWatch.elapsed.inSeconds}");

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        widgetArr.insert(1, Image.asset("assets/images/ic_boy.png"));
      });
      print("Images Added ${stopWatch.elapsed.inSeconds}");
    });

    setState(() {
      widgetArr.insert(
          2,
          Text(
            "Widget Three",
            textScaleFactor: 2,
          ));
    });

    print("Text Added ${stopWatch.elapsed.inSeconds}");
  }

  //case 3 *********************ASYNCHRONOUS(async await)******************************
  /*
  Asynchronous Method to get Image
   */

  Future<String> getImageFromNetwork() async {
    String name = "";

    await Future.delayed(Duration(seconds: 5), () {
      name = "assets/images/ic_boy.png";
    });
    return name;
  }

  /*
  It is a simple asynchronous call to add image.
  but since we are using await the thread will be blocked
  The image addition is delayed
  so the widget 3 will be added after that
  so we can show a progress bar while loading the image
  We should use this when we actually need the result after await
  method to render into UI
   */
  getNetworkAssetBlocking() async {
    // Since we are using getImageFromNetwork() async method here
    // so this method also need to be declared async just like
    // suspend concept in kotlin

    // thread is blocked and awaiting 5 secs
    /*
    ASynchronous call
    get Network Asset Delay start - 0
    Images Added 5
    Text Added 5
     */
    print("get Network Asset start - ${stopWatch.elapsed.inSeconds}");

    String image = await getImageFromNetwork();
    setState(() {
      widgetArr.insert(1, Image.asset(image));
      print("Images Added ${stopWatch.elapsed.inSeconds}");
    });

    setState(() {
      widgetArr.insert(
          2,
          Text(
            "Widget Three",
            textScaleFactor: 2,
          ));
    });

    print("Text Added ${stopWatch.elapsed.inSeconds}");
  }

  //case 4 *********************ASYNCHRONOUS(async then)******************************
  /*
  It is a simple asynchronous call to add image.
  but since we are not using await the thread will not be blocked
  The image addition is delayed
  so the widget 3 will be added after that
  so we can show a progress bar while loading the image
  We should use this when we actually don't need the result after await,
  instead we can use then to get the result and do anything finally
  such as render into UI
   */
  getNetworkAssetAsync2() async {
    // thread is not blocked
    /*
    ASynchronous call
    get Network Asset Delay start - 0
    Images Added 5
    Text Added 0
     */
    print("get Network Asset start - ${stopWatch.elapsed.inSeconds}");

    getImageFromNetwork().then((value) {
      setState(() {
        widgetArr.insert(1, Image.asset(value));
        print("Images Added ${stopWatch.elapsed.inSeconds}");
      });
    });

    setState(() {
      widgetArr.insert(
          2,
          Text(
            "Widget Three",
            textScaleFactor: 2,
          ));
    });

    print("Text Added ${stopWatch.elapsed.inSeconds}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Flutter Container"),
        ),
        body: Scaffold(
          body: Center(
            child: Column(
              children: widgetArr,
            ),
          ),
        ));
  }


  //case 5 *************************ASYNCHRONOUS(Future Builder)*********************************

  /*
  Creates a widget that builds itself based on the latest
  snapshot of interaction with a Future.

  future : it takes the async method callback
  builder : it builds the widget using snapshot.data

  the ui will be blocked and a progress bar will be shown
  until the async method returns result
   */

  // Future<String> getImageFromNetworkFutureBuilder() async {
  //   String name = "";
  //   await Future.delayed(Duration(seconds: 5), () {
  //     name = "assets/images/ic_boy.png";
  //   });
  //   return name;
  // }
  //
  //
  // @override
  // Widget build(BuildContext context) {
  //   return FutureBuilder(
  //       future: getImageFromNetworkFutureBuilder(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Scaffold(
  //             appBar: AppBar(
  //               title: Text("Using Future Builder"),
  //             ),
  //             body: Center(
  //               child: Column(children: [
  //                 Text(
  //                   "Widget One",
  //                   textScaleFactor: 2,
  //                 ),
  //                 Image.asset(snapshot.data.toString())
  //               ]),
  //             ),
  //           );
  //         } else {
  //           return const Center(
  //             child: CircularProgressIndicator(),
  //           );
  //         }
  //       });
  // }
}
