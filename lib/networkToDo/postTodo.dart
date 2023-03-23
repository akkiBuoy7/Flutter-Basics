class PostToDoItem {
  PostToDoItem({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });


  String userId;
  String id;
  String title;
  String completed;

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}