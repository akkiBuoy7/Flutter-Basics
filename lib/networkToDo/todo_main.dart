import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_basics/networkToDo/postTodo.dart';
import 'package:flutter_basics/networkToDo/todo.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // fetchTodo() async {
  //   const getUrl = "https://jsonplaceholder.typicode.com/todos/1";
  //   var response = await http.get(Uri.parse(getUrl));
  //   var data = jsonDecode(response.body);
  //   print("Body: " + response.body);
  //   //data is a map and the properties can be accessed using the [] notation of map.
  //   print("title: " + data['title']);
  //   print("StatusCode : " + response.statusCode.toString());
  //   print("Headers: " + response.headers.toString());
  // }


//this method is making a get request to the getUrl and printing the received data to the console
  fetchTodo() async {
    var response;
    //contains code that can throw error`
    try {
      const getUrl = "https://jsonplaceholder.typicode.com/todos/1";
      response = await http.get(Uri.parse(getUrl));
      //data is a map and the properties can be accessed using the [] notation of map.
      //var data = jsonDecode(response.body);
      var finalResponse = toDoFromJson(response.body.toString());
      print("Body: *************" + response.body);
      print("title: " + finalResponse.title);
    }
    //error handling code
    catch (err) {
      print("Error Message: " + err.toString());
    }
    //Continue execution for the rest of code
    print("StatusCode : " + response.statusCode.toString());
    print("Headers: " + response.headers.toString());
  }

//this method is making a post request to the postUrl and printing the received data to the //console
  postTodo() async {
    var response;

    try {
      const posturl = "https://jsonplaceholder.typicode.com/todos";
      var todoObj = PostToDoItem(
          userId: "8", id: "12", title: "Go To Market", completed: "false");
      // const todo = {
      //   "userId": "5",
      //   "id": "10",
      //   "title": "Go to walk",
      //   "completed": "true",
      // };
      response = await http.post(Uri.parse(posturl), body: todoObj.toJson());
      print("Body: *************" + response.body);
    } catch (err) {
      print("Error Message: " + err.toString());
    }
    //Continue execution for the rest of code
    print("StatusCode : " + response.statusCode.toString());
    print("Headers: " + response.headers.toString());
  }

//this method is making a delete request to the deleteUrl and printing the received data to the console
  deleteTodo() async {
    var response;
    try {
      const delUrl = "https://jsonplaceholder.typicode.com/todos/1";
      response = await http.delete(Uri.parse(delUrl));
      print("Body: *************" + response.body);
    } catch (err) {
      print("Error Message: " + err.toString());
    }

    print(
        "Successfuly deleted\nStatusCode : " + response.statusCode.toString());
  }

//this method is making a put request to the getUrl and printing the received data to the console
  updateTodo() async {
    var response;

    try {
      const updateUrl = "https://jsonplaceholder.typicode.com/todos/1";
      var todoObj = PostToDoItem(
          userId: "8", id: "12", title: "Go To Market", completed: "false");
      // const updatedTodo = {
      //   "userId": "8",
      //   "id": "12",
      //   "title": "Go to market",
      //   "completed": "false",
      // };
      response = await http.put(Uri.parse(updateUrl), body: todoObj.toJson());
      print("Body: *************" + response.body);
    } catch (err) {
      print("Error Message: " + err.toString());
    }
    print(
        "Successfuly updated\nStatusCode : " + response.statusCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('http demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () {
//Here we are calling the fetchTodo method
                  fetchTodo();
                },
                child: Text('fetch todo'),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () {
//Here we are calling the postTodo method
                  postTodo();
                },
                child: Text('post todo'),
                color: Colors.red,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () {
//Here we are calling the deleteTodo method
                  deleteTodo();
                },
                child: Text('delete todo'),
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () {
//Here we are calling the updateTodo method
                  updateTodo();
                },
                child: Text('update todo'),
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
