import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/shaedPref/AppBar.dart';
import 'package:flutter_basics/shaedPref/Dash.dart';
import 'package:flutter_basics/shaedPref/data.dart';
import 'package:flutter_basics/shaedPref/MyCustomTextField.dart';
import 'package:flutter_basics/shaedPref/util.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoginUi();
  }
}

class LoginUi extends StatelessWidget {
  var userData;
  var textFieldEmailWidget = MyCustomTextField.ControllerType(
    controllerType: Utility.TEXT_CONTROLLERTYPE,
      icon:Icon(Icons.email)
  );

  var noFieldEmailWidget = MyCustomTextField.ControllerType(
    controllerType: Utility.NUMBER_CONTROLLERTYPE,
      icon:Icon(Icons.phone)
  );

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: const MyAppBar("Login"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: textFieldEmailWidget, // using a custom Textfield
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: noFieldEmailWidget,
            ),

            ElevatedButton(
                onPressed: () {

                  String email = textFieldEmailWidget.emailText.text.toString();
                  String phone = noFieldEmailWidget.phoneText.text.toString();

                  print("**************$phone");

                  var userData = UserData(email, int.parse(phone));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashPage(userData)));
                },
                child: Text('Login')),
          ],
        ));
  }
}
