class News {
  int userId;
  int id;
  String title;
  String body;

  News.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}
