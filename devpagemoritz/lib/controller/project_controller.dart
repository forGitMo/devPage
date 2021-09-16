import 'package:cloud_firestore/cloud_firestore.dart';

class ProjectController {
  static String _stringToMarkdown(String str) {
    return str.replaceAll('\\n', '\n');
  }

  static Future<String> loadProjectById(String id) async {
    final doc =
        await FirebaseFirestore.instance.collection('projects').doc(id).get();
    if (doc.data() != null) {
      return _stringToMarkdown(doc.data()!['imgUrl'] as String);
    }
    return '';
  }
}
