

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Controller object to get the input
  var emailText = TextEditingController();
  var passText = TextEditingController();
  var phoneText = TextEditingController();

  bool _hideText = true;
  String _typedText = "";
  String _typedNo = "";
  RegExp stringValidator = RegExp("^(?=.*[a-zA-Z])(?=.*[0-9])[A-Za-z0-9]+\$");
  bool isAString = true;

  @override
  Widget build(BuildContext context) {


    // listening to text changes with controller
    phoneText.addListener(() {
      setState(() {
        _typedNo = phoneText.text;
      });
    });

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Flutter Container"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RichText(text: TextSpan(
              text: "Entered email is ",
              style: TextStyle(color: Colors.black),
              children:[ TextSpan(
                text: "$_typedText",
                style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
              )]
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: emailText,
                maxLength: 7,
                onChanged: (value){ // listening to text changes with onChanged
                  setState(() {
                    _typedText = value;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: RichText(text: TextSpan(
                text: "Entered ph no is ",
                style: TextStyle(color: Colors.black),
                children:[ TextSpan(
                    text: "$_typedNo",
                    style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)
                )]
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: phoneText,  // set controller to get the input
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  // # property to change decor on focused
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2
                      )
                  ),
                  //# property to change decor on not focussed
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: EdgeInsets.only(left: 20,right: 20),
              child: TextField(
                controller: passText,
                obscureText: _hideText,
                obscuringCharacter: "*",
                onChanged: (value){
                  if(value.isEmpty || stringValidator.hasMatch(value)){
                    setValidator(true);
                  }else{
                    setValidator(false);
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.key),
                  errorText: isAString?null:"Please enter alpha numeric password",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: (){

                      setState(() {
                        _hideText = !_hideText;
                      });

                    },
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2
                      )
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(
                          color: Colors.grey,
                          width: 2
                      )
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                String email = emailText.text.toString();
                String password = passText.text.toString();
                String phone = phoneText.text.toString();
                print("*********email:$email phone:$phone password:$password");
              },
              child: Text('Login')),
        ],
      )
    );
  }

  void setValidator(valid) {
    setState(() {
      isAString = valid;
    });
  }
}