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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            SizedBox(
              height: 15,
            ),
            Flexible(
              child: GridView.extent(
                maxCrossAxisExtent: 50,
                // width of each item along main axis(row)
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
            SizedBox(
              height: 15,
            ),
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                primary: false,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Container(color: arrayColors[index]);
                },
                itemCount: arrayColors.length,
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Flexible(
            //   child: GridView.count(
            //       crossAxisCount: 3,
            //       crossAxisSpacing: 4.0,
            //       mainAxisSpacing: 8.0,
            //       children: List.generate(menuItems.length, (index) {
            //         return Center(
            //           child: OptionCard(menuItem: menuItems[index]),
            //         );
            //       })),
            // )
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({this.title = "", this.icon = const IconData(0)});

  final String title;
  final IconData icon;
}

const List<MenuItem> menuItems = const <MenuItem>[
  const MenuItem(title: 'Login', icon: Icons.login_outlined),
  const MenuItem(title: 'Settings', icon: Icons.settings),
  const MenuItem(title: 'Contact Us', icon: Icons.phone),
  const MenuItem(title: 'Map', icon: Icons.map_outlined),
  const MenuItem(title: 'Camera', icon: Icons.camera_alt),
  const MenuItem(title: 'WiFi', icon: Icons.wifi),
  const MenuItem(title: 'Album', icon: Icons.photo_album),
  const MenuItem(title: 'Logout', icon: Icons.logout),
];

class OptionCard extends StatelessWidget {
  const OptionCard({Key key = const Key(""), this.menuItem = const MenuItem()})
      : super(key: key);
  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.green.shade100,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child:
                        Icon(menuItem.icon, size: 50.0, color: Colors.white)),
                Text(menuItem.title,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ]),
        ));
  }
}

/*
For static
Gridview.count()
  # crossAxisCount: we can mention the no of items along the row
Gridview.extent()
  # maxCrossAxisExtent: we can mention the extent of each item
crossAxisSpacing:
You can use this property to specify the space between each grid/child widget
present along the cross axis. It takes a numerical value with pixel as the unit.

mainAxisSpacing:
You can use this property to specify the space between each grid/child widget
present along the main axis. It takes a numerical value with pixel as the unit.

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
