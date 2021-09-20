import 'dart:convert';

class Project {
  String id;
  String title;
  String description;
  String imgUrl;
  String projectUrl;

  Project(
      {required this.id,
      required this.title,
      required this.description,
      required this.imgUrl,
      required this.projectUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imgUrl': imgUrl,
      'projectUrl': projectUrl,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      title: map['title'],
      description: _stringToMarkdown(map['description']),
      projectUrl: map['projectUrl'],
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  static String _stringToMarkdown(String str) {
    return str.replaceAll('\\n', '\n');
  }
}
