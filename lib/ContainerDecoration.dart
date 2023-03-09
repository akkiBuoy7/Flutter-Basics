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
          title: const Text("Flutter Container"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.greenAccent,
          child: Center(
            child: SizedBox(
              width: 400,
              height: 400,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(blurRadius: 10, color: Colors.white)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            "1",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            "2",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 10)
                              ]),
                          child: const Center(
                              child: Text(
                            "3",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            "4",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            "5",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: const Center(
                              child: Text(
                            "6",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          )),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
