import 'package:equatable/equatable.dart';

class PostItem extends Equatable {
  /*
  * {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
}
  * */
  final int id;
  final String title;
  final String body;

  PostItem(this.id, this.title, this.body);

  PostItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        body = json['body'];

  @override
  String toString() {
    return 'Post{id: $id, title: $title, body: $body}';
  }
}
