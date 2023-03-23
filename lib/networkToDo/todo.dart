// To parse this JSON data, do
//
//     final toDo = toDoFromJson(jsonString);

import 'dart:convert';

ToDoItem toDoFromJson(String str) => ToDoItem.fromJson(json.decode(str));

String toDoToJson(ToDoItem data) => json.encode(data.toJson());

class ToDoItem {
  ToDoItem({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });


  int userId;
  int id;
  String title;
  bool completed;

  factory ToDoItem.fromJson(Map<String, dynamic> json) => ToDoItem(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
