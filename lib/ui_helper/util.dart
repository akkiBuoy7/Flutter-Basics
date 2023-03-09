import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle customTextstyle(
    {Color textColor = Colors.black,
    fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal}) {
  return TextStyle(
      fontSize: fontSize,
      color: textColor,
      fontWeight: FontWeight.w900,
      fontStyle: fontStyle);
}
