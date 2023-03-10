import 'package:flutter/material.dart';
import 'package:flutter_basics/ui_helper/util.dart';

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
          title: Text("Custom Widget"),
        ),
        body: Column(
          children: [
            List1(),
            List2(),
            List3(),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.lightGreenAccent,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                      ),
                    );
                  },itemCount: 5,
                  scrollDirection: Axis.horizontal,),
                )),
          ],
        ));
  }
}

class List1 extends StatelessWidget{
  const List1({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.lightGreen,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/ic_boy.png'),
                  backgroundColor: Colors.black,
                ),
              ),
            );
          },
          itemCount: 5,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class List2 extends StatelessWidget{

  var arrNames = ["Sachin", "Dhoni", "Kohli", "Ganguly", "Jadeja", "Ashwin"];

  List2({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/ic_boy.png'),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(arrNames[index],
                      style: const TextStyle(fontFamily: 'CustomFont')),
                  subtitle: Text(arrNames[index]),
                  trailing: const Icon(Icons.add),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 10,
                );
              },
              itemCount: arrNames.length),
        ));
  }

}

class List3 extends StatelessWidget{
  var arrNames = ["Sachin", "Dhoni", "Kohli", "Ganguly", "Jadeja", "Ashwin"];

  List3({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
        flex: 2,
        child: Container(
          child: ListView.builder(itemBuilder: (context, index) {
            return List3Child(index);
          },
            itemCount: 5,
            scrollDirection: Axis.horizontal,),
        ));
  }
}

class List3Child extends StatelessWidget{

  int index=0;

  List3Child(this.index);

  var arrNames = ["Sachin", "Dhoni", "Kohli", "Ganguly", "Jadeja", "Ashwin"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.yellow,
        width: 100,
        height: 100,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                arrNames[index], style: customTextstyle(fontSize: 15.0),),
            ),
            SizedBox(height: 10,),
            Text(
              arrNames[index], style: TextStyle(fontSize: 15.0,
                fontFamily: 'CustomFont'),),
          ],
        ),
      ),
    );
  }

}  // custom List Item child

class List4 extends StatelessWidget{
  const List4({super.key});


  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
          color: Colors.lightGreenAccent,
          child: ListView.builder(itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
            );
          },itemCount: 5,
            scrollDirection: Axis.horizontal,),
        ));
  }

}
