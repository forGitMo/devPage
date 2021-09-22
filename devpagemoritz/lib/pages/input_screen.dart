import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/models/project.dart';

class InputScreen extends StatefulWidget {
  InputScreen(this.project);
  final Project project;

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController imgUrl = TextEditingController();

  TextEditingController projectUrl = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  createData() async {
    try {
      await firebase.collection('projects').doc().set({
        'title': title.text,
        'description': description.text,
        'imgUrl': imgUrl.text,
        'projectUrl': projectUrl.text
      });
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Create new project',
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'title',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.title_rounded,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'description',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.text_snippet_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: imgUrl,
                  decoration: InputDecoration(
                    hintText: 'imgUrl',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.image,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: projectUrl,
                  decoration: InputDecoration(
                    hintText: 'projectUrl',
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
                    createData();
                    title.clear();
                    description.clear();
                    imgUrl.clear();
                    projectUrl.clear();
                  },
                  child: Text('create')),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
