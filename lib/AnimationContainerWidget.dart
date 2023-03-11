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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Container"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [MyAnimatedContainer(),
          MyAnimatedOpacity()],
        ),
      ),
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  var _width = 200.0;
  var _height = 100.0;
  bool isAnimate = false;
  Curve myCurves = Curves.bounceIn;
  BoxDecoration myDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(2),
    color: Colors.blue,
  );

  void animateFoo() {
    if (!isAnimate) {
      _width = 100;
      _height = 200;
      isAnimate = true;
      myCurves = Curves.bounceIn;
      myDecor = BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.yellow,
      );
    } else {
      _width = 200;
      _height = 100;
      isAnimate = false;
      myCurves = Curves.bounceOut;
      myDecor = BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          width: _width,
          height: _height,
          curve: myCurves,
          decoration: myDecor,
          duration: Duration(seconds: 1),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                animateFoo();
              });
            },
            child: Text("Animate"))
      ],
    );
  }
}

class MyAnimatedOpacity extends StatefulWidget {
  const MyAnimatedOpacity({super.key});

  @override
  State<MyAnimatedOpacity> createState() => _MyAnimatedOpacityState();
}

class _MyAnimatedOpacityState extends State<MyAnimatedOpacity> {
  bool isVisible = true;
  var myOpacity = 1.0;

  void animateFoo() {
    if (isVisible) {
      isVisible = false;
      myOpacity = 0;
    } else {
      isVisible = true;
      myOpacity = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 100,
          ),
          duration: Duration(seconds: 1),
          opacity: myOpacity,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                animateFoo();
              });
            },
            child: Text("Opacity"))
      ],
    );
  }
}

/* AnimatedContainer => On Changing shape or visibility it animates
     curve : helps in transition

   AnimatedOpacity => It can be used for visibility and alpha value
     opacity : 0 -> invisible
               1 -> visible
               0.5 -> transparent
 */
