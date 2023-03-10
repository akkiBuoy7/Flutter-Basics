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
  var arrayColors = [
    Colors.grey,
    Colors.blue,
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.lightGreen,
    Colors.yellow
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Container"),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize : MainAxisSize.min,
          children: [
          Flexible(
            child: GridView.count(
              primary: false,
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                Container(
                  color: arrayColors[0],
                ),
                Container(
                  color: arrayColors[1],
                ),
                Container(
                  color: arrayColors[2],
                ),
                Container(
                  color: arrayColors[3],
                ),
                Container(
                  color: arrayColors[4],
                ),
                Container(
                  color: arrayColors[5],
                ),
                Container(
                  color: arrayColors[6],
                ),
              ],
            ),
          ),
            SizedBox(height: 15,),
            Flexible(
              child: GridView.extent(
                maxCrossAxisExtent: 50, // width of each item along main axis(row)
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(
                    color: arrayColors[0],
                  ),
                  Container(
                    color: arrayColors[1],
                  ),
                  Container(
                    color: arrayColors[2],
                  ),
                  Container(
                    color: arrayColors[3],
                  ),
                  Container(
                    color: arrayColors[4],
                  ),
                  Container(
                    color: arrayColors[5],
                  ),
                  Container(
                    color: arrayColors[6],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Flexible(
              child: GridView.builder(
                shrinkWrap:true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
                  itemBuilder: (context,index){
                return Container(color: arrayColors[index]);
                  },
              itemCount: arrayColors.length,),
            )
        ,SizedBox(height: 15,),
          // Flexible(
          //   child: GridView.builder(
          //     shrinkWrap: true,
          //       primary: false,
          //       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     mainAxisSpacing: 10,
          //     crossAxisSpacing: 10, maxCrossAxisExtent: 100
          //   ), itemBuilder: (context,index){
          //     return Container(color: arrayColors[index],);
          //   }),
          // )
          ],
        ),
      )
      ,
    );
  }
}

/*
For static
Gridview.count()
  # crossAxisCount: we can mention the no of items along the row
Gridview.extent()
  # maxCrossAxisExtent: we can mention the extent of each item

For dynamic
Gridview.builder()
  #  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount : we can mention the no of items along the row
  # gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: we can mention the extent of each item

# If we are using a column inside a scrollview then a vertical constraint
is required for the scrollview so that column's children can be rendered.
since we don't have vertical constraint for scrollview we will use
Flexible for each children of Column()
shrinkwrap : true
primary : false
 */
