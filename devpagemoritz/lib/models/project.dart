import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

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

  factory Project.fromDocumentSnapshot(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return Project(
      id: doc.id,
      title: doc['title'],
      description: _stringToMarkdown(doc['description']),
      projectUrl: doc['projectUrl'],
      imgUrl: doc['imgUrl'],
    );
  }

  static String _stringToMarkdown(String str) {
    return str.replaceAll('\\n', '\n');
  }
}
