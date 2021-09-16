import 'package:cloud_firestore/cloud_firestore.dart';

class UrheberController {
  static String _stringToMarkdown(String str) {
    return str.replaceAll('\\n', '\n');
  }

  static Future<String> loadImpressumById(String id) async {
    final doc =
        await FirebaseFirestore.instance.collection('markdown').doc(id).get();
    if (doc.data() != null) {
      return _stringToMarkdown(doc.data()!['data'] as String);
    }
    return '';
  }
}
