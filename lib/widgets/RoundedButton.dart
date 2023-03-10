import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/ui_helper/util.dart';

class RoundedButton extends StatelessWidget {
  TextStyle? textStyle;
  String btnName;
  Icon? icon;
  Color? color;
  VoidCallback callback;

  RoundedButton(
      {this.textStyle,
      required this.btnName,
      this.icon,
      this.color,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          callback();
        },
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shadowColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      )

    ),
        child: icon != null
            ? Row( // if icon is present show in row both icon and text else text only
                children: [
                  icon!,
                  SizedBox(width: 30,),
                  Text(
                    btnName,
                    style: textStyle,
                  )
                ],
              )
            : Text(btnName, style: textStyle),);
  }
}
/*
VoidCallback => useful for calling a callback on any button click
 */
