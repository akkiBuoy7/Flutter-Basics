import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basics/shaedPref/AppBar.dart';
import 'package:flutter_basics/shaedPref/Dash.dart';
import 'package:flutter_basics/shaedPref/data.dart';
import 'package:flutter_basics/shaedPref/MyCustomTextField.dart';
import 'package:flutter_basics/shaedPref/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  var userData;
  SharedPreferences? preferences;
  var savedData;

  var textFieldEmailWidget = MyCustomTextField.ControllerType(
      controllerType: Utility.TEXT_CONTROLLERTYPE, icon: Icon(Icons.email));

  var noFieldEmailWidget = MyCustomTextField.ControllerType(
      controllerType: Utility.NUMBER_CONTROLLERTYPE, icon: Icon(Icons.phone));

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete((){
      setState(() {});
    });
  }

  Future<void> initializePreference() async{
    this.preferences = await SharedPreferences.getInstance();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  savedData = email;
                  preferences?.setString(Utility.EMAIl_PREF, savedData);
                  setState(() {});
                },
                child: Text('Save')),
            Text(
                "saved email is ${preferences?.getString(Utility.EMAIl_PREF)}"),
          ],
        ));
  }
}

// class LoginUi extends StatefulWidget {
//
//   @override
//   State<LoginUi> createState() => _LoginUiState();
// }
//
// class _LoginUiState extends State<LoginUi> {
//   var userData;
//   SharedPreferences? preferences;
//   var savedData;
//
//   var textFieldEmailWidget = MyCustomTextField.ControllerType(
//       controllerType: Utility.TEXT_CONTROLLERTYPE, icon: Icon(Icons.email));
//
//   var noFieldEmailWidget = MyCustomTextField.ControllerType(
//       controllerType: Utility.NUMBER_CONTROLLERTYPE, icon: Icon(Icons.phone));
//
//   Future<SharedPreferences?> getPrefInstance() async{
//     preferences = await SharedPreferences.getInstance();
//     return preferences;
//   }
//
//   void saveData(String? input){
//     var pref = getPrefInstance();
//
//     pref.then((result) {
//       result?.setString(Utility.EMAIl_PREF,input!);
//     });
//     setState(() {
//
//     });
//     // debugPrint("Runed");
//     // pref.then((result) {
//     //   print("Input********saved${result.getString(Utility.EMAIl_PREF)}");
//     //   result.getString(Utility.EMAIl_PREF);
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: const MyAppBar("Login"),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: textFieldEmailWidget, // using a custom Textfield
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10),
//               child: noFieldEmailWidget,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   String email = textFieldEmailWidget.emailText.text.toString();
//                   String phone = noFieldEmailWidget.phoneText.text.toString();
//                   savedData = email;
//                   print("**************$phone");
//
//                   var userData = UserData(email, int.parse(phone));
//                   saveData(savedData);
//
//                   // Navigator.push(
//                   //     context,
//                   //     MaterialPageRoute(
//                   //         builder: (context) => DashPage(userData)));
//                 },
//                 child: Text('Save')),
//             Text(
//                 "saved email is ${preferences?.getString(Utility.EMAIl_PREF)}"),
//           ],
//         ));
//   }
// }
