import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_basics/networkCall/DetailsPage.dart';
import 'package:flutter_basics/networkCall/Model.dart';
import 'package:http/http.dart' as http;

class MyMainPage extends StatefulWidget {
  const MyMainPage({Key? key}) : super(key: key);

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  List<UserDetails> userDetails = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Flutter Container"),
              ),
              body: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListViewItem(
                      userDetails: userDetails,
                      index: index,
                    ),
                  );
                },
                itemCount: userDetails.length,
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  // Method to get data from API
  Future<List<UserDetails>> getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        userDetails.add(UserDetails.fromJson(index));
      }
      return userDetails;
    } else {
      return userDetails;
    }
  }
}

class ListViewItem extends StatelessWidget {
  int index;
  String? fieldName;
  String? content;
  List<UserDetails?> userDetails = [];

  ListViewItem({required this.userDetails, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsPage(userDetails[index]!)));
      
      print("***************${userDetails[index]?.name.toString()}");
    },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTextWidget(
                  index: index,
                  fieldName: "ID: ",
                  content: userDetails[index]?.id.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTextWidget(index: index,
                  fieldName: "Name: ",
                  content:  '${userDetails[index]?.name.toString()}'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTextWidget(index: index,
                  fieldName: "Phone: ",
                  content: userDetails[index]?.phone.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTextWidget(index: index,
                  fieldName: "Company Name: ",
                  content: userDetails[index]?.company.name.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getTextWidget(index: index,
                  fieldName: "Address: ",
                  content: "${userDetails[index]?.address.street
                  }, ${userDetails[index]?.address.city} "),
            )
          ],
        ),
      ),
    );
  }

  Text getTextWidget({int? index, String? fieldName, String? content}) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: fieldName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      TextSpan(
          text: content,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
    ]));
  }
}
