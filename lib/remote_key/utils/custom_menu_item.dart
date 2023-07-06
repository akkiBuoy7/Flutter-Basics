import 'package:flutter/material.dart';

class CustomDropDownItem extends DropdownMenuItem{

  Widget child;
  String value;

  CustomDropDownItem({required this.child,required this.value}) : super(child: child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }

}