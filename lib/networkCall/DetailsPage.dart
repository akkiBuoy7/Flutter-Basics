
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/networkCall/Model.dart';

class DetailsPage extends StatelessWidget{

  UserDetails userDetails;

  DetailsPage(this.userDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Center(
        child: Container(
          child: Text(userDetails.name,style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
        ),
      ),
    );
  }


}