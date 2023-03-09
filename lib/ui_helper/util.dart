import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle customTextstyle(
    {Color textColor = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal}) {
  return TextStyle(
      fontSize: 11,
      color: textColor,
      fontWeight: FontWeight.w900,
      fontStyle: fontStyle);
}
