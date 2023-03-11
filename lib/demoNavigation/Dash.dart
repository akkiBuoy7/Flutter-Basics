import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/button.dart';
import 'package:flutter_basics/demoNavigation/AppBar.dart';
import 'package:flutter_basics/demoNavigation/data.dart';
import 'package:flutter_basics/ui_helper/util.dart';

class DashPage extends StatefulWidget{

  String? name;
  int? phNo;
  UserData? userData;

  DashPage(this.userData);

  @override
  State<DashPage> createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {

  @override
  Widget build(BuildContext context) {
    return DashUi(widget.userData);
  }
}

class DashUi extends StatefulWidget{

  UserData? userData;
  DashUi(this.userData);


  @override
  State<StatefulWidget> createState() {
    return _DashUiState();
  }
}

class _DashUiState extends State<DashUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        "Dash"
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${widget.userData?.name.toString()}",style: customTextstyle(),),
            SizedBox(height: 25,),
            Text("Ph no : ${widget.userData?.phNo.toString()}",style: customTextstyle())
          ],
        ),
      ),
    );
  }
}