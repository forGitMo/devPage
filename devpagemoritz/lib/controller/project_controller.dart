import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/models/project.dart';

class ProjectController {
  static Future<List<Project>> loadAllProject() async {
    final docs =
        (await FirebaseFirestore.instance.collection('projects').get()).docs;
    return docs
        .map(
          (doc) => Project.fromDocumentSnapshot(doc),
        )
        .toList();
  }
}
