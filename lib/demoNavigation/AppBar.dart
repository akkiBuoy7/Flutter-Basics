import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget{

  final String? myTitle;

  const MyAppBar(this.myTitle, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppBarState(myTitle);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _MyAppBarState extends State<MyAppBar>{

  final String? myTitle;


  _MyAppBarState(this.myTitle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(myTitle!),
    );
  }

}