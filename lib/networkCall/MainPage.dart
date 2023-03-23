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

    
    //The response.body contains data in string JSON format. To convert it into a Dart map,
    // we have can use the jsonDecode function.
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

/*
There are 4 useful methods inside http package.

   1. get:  http.get(Uri.parse(<url>),headers:);
     for adding header:
                     headers: {
                HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
                  },

get method is used to fetch data from a server. For example, when we open the lex website
in the browser it makes a get request to the lex server to fetch the content that needs to
 display on the webpage. The lex server then responds with the requested data.

   2. post: http.post(Uri.parse(<url>), body: <data in form of map>);

post method is used to create a resource on a server. For example, when we are posting an
image on Instagram, it actually makes a post request to Instagram's server to save the post
to the database. The server saves the post and responds with appropriate data and status code.

  3. delete: http.delete(Uri.parse(delUrl));

delete method is used to delete an existing resource on the server. For example, deleting
an image from Instagram makes a delete request to the server for the corresponding image and
the server deletes the image from the database.

  4. put: http.put(Uri.parse(<url>), body: <updatedData in form of map>);

put method is used to update an existing resource on the server. For example, when we edit
our account details on any website, it makes a put request to update the content.


What do we get back after making an HTTP request ?

All these methods return a Future that contains a Response.
We get a response from the HTTP request. This response contains 3 useful parameters

 body
It contains the actual data we fetched/sent by the server

statusCode
It is the request status like 200(successful), 201(created), etc.

headers
Headers are the additional information passed by the client along with the request
 and passed by the server along with the response. For eg the type of data,
  authentication token, etc.

 */
