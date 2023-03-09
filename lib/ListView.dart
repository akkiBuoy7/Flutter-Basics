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
    var arrPlanets = [
      "Venus",
      "Mars",
      "Jupiter",
      "Earth",
      "Pluto",
      "Saturn",
      "Mercury"
    ];
    var arrNames = [
      "Sachin",
      "Dhoni",
      "Kohli",
      "Ganguly",
      "Jadeja",
      "Ashwin"
    ];
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Flutter Container"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 100,),
            SizedBox(
              height: 100,
              child: ListView(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Item 1",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height:200,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    arrNames[index],
                    style: TextStyle(fontSize: 21),
                  );
                },
                itemCount: arrNames.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(height: 20);
                },
              ),
            ),
            SizedBox(height: 100,),
            SizedBox(
              height: 200,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(
                    arrPlanets[index],
                    style: TextStyle(fontSize: 21),
                  );
                },
                itemCount: arrPlanets.length,
                itemExtent: 50,
              ),
            ),
            SizedBox(height: 100,),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Text(
                    arrNames[index],
                    style: const TextStyle(fontSize: 21),
                  );
                },
                itemCount: arrNames.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(height: 20);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
ListView => Used for static items
 :reverse => reverses the listview
 :scrollDirection

ListView.builder => used for dynamic data
  itemCount => list size
  itemExtent => space between items
  itemBuilder => takes context and index of the list as param
   returns any widget like Text(data =  <desired List[index]>)

 ListView.separated => used to provide a divider between items
  separatorBuilder => will return the divider item
  itemBuilder => takes context and index of the list as param
   returns any widget like Text(data =  <desired List[index]>)

# If using multiple listviews inside column, then need to provide
   height constraint for each listview by using
   SizedBox/Expanded/Flexible

   # If using Listview inside ScrollView then need to use
   primary: false
   shrinkWrap:true
   for each of the child listViews
 */
