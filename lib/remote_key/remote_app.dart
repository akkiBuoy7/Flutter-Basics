import 'package:flutter/material.dart';
import 'package:flutter_basics/remote_key/remote_home.dart';
import 'package:flutter_basics/remote_key/remote_key_home.dart';

void main() {
  runApp(const RemoteApp());
}

class RemoteApp extends StatelessWidget {
  const RemoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Remote App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home:  RemoteKeyHomePage(),
    );
  }
}

