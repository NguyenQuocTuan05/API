import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  int id;
  String title;
  String thumb;
  String content;
  String publish_date;
  Map category;
  News({
    required this.id,
    required this.title,
    required this.thumb,
    required this.content,
    required this.publish_date,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumb': thumb,
      'content': content,
      'publish_date': publish_date,
      'category': category,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      id: map['id'] as int,
      title: map['title'] ?? '',
      thumb: map['thumb'] ?? '',
      content: map['content'] ?? '',
      publish_date: map['publish_date'] ?? '',
      category: Map.from(
        (map['category'] ?? {}),
      ),
    );
  }
}
