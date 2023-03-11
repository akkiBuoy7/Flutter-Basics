import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/demoNavigation/AppBar.dart';
import 'package:flutter_basics/demoNavigation/Dash.dart';
import 'package:flutter_basics/demoNavigation/data.dart';

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
  // Controller object to get the input
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var phoneText = TextEditingController();

  var userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar("Login"),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: phoneText, // set controller to get the input
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    // # property to change decor on focused
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    //# property to change decor on not focussed
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: passText,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {},
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.blue, width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.grey, width: 2)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  String email = emailText.text.toString();
                  String password = passText.text.toString();
                  String phone = phoneText.text.toString();

                  var userData = UserData(email,int.parse(phone));

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashPage(
                          userData
                      )));
                },
                child: Text('Login')),
          ],
        ));
  }
}
