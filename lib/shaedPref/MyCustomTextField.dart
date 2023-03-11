import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/shaedPref/util.dart';

class MyCustomTextField extends StatefulWidget {
  var emailText = TextEditingController();
  var phoneText = TextEditingController();
  Icon? icon;

  var controllerType = "";

   MyCustomTextField.ControllerType({controllerType = ""
   , Icon? icon}) {
    this.controllerType = controllerType;
    this.icon = icon;
  }


  @override
  State<MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: widget.controllerType == Utility.TEXT_CONTROLLERTYPE
            ? widget.emailText
            : widget.phoneText,
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: Colors.blue, width: 2)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
              borderSide: BorderSide(color: Colors.grey, width: 2)),
        ),
      ),
    );
  }
}
