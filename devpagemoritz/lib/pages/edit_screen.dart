import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:devpagemoritz/models/project.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  EditScreen({required this.project});
  final Project project;

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController imgUrl = TextEditingController();
  TextEditingController projectUrl = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  void _edit() async {
    try {
      firestore.collection('projects').doc('${project.id}').update({
        'title': title.text,
        'description': description.text,
        'imgUrl': imgUrl.text,
        'projectUrl': projectUrl.text,
      });
      print('documentSnapshot.data()');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create new project',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: title,
                  decoration: const InputDecoration(
                    hintText: 'new title',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.title_rounded,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: description,
                  decoration: const InputDecoration(
                    hintText: 'new description',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.text_snippet_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: imgUrl,
                  decoration: const InputDecoration(
                    hintText: 'new imgUrl',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.image,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: projectUrl,
                  decoration: const InputDecoration(
                    hintText: 'new projectUrl',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.folder_open_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _edit();
                  title.clear();
                  description.clear();
                  imgUrl.clear();
                  projectUrl.clear();
                },
                child: const Text(
                  'edit',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
