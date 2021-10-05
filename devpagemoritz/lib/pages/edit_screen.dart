import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:devpagemoritz/models/project.dart';

import 'project_screen.dart';

class EditScreen extends StatefulWidget {
  EditScreen({required this.project});
  final Project project;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  File? image;
  var e = 0;
  Future pickImg() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
      uploadFile(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future createImg() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final File? imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
      uploadFile(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  firebase_storage.Reference ref =
      firebase_storage.FirebaseStorage.instance.ref().child('images');

  var time = DateTime.now();
  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('images/img' + '$time')
          .putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  TextEditingController title = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController imgUrl = TextEditingController();

  TextEditingController projectUrl = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  final firebase = FirebaseFirestore.instance;
  late final VoidCallback callback;
  var URL;
  //dowload from storage
  downloadStorage() async {
    await firebase_storage.FirebaseStorage.instance
        .ref('images/img' + '$time')
        .getDownloadURL()
        .then((url) {
      URL = url;
      print('Storage url:' + URL);
    });
  }

  Future<void> _edit() async {
    var projectID = firebase.doc('projects').id.toString();
    print(projectID);
    try {
      firestore.collection('projects').doc('$projectID').update({
        'title': title.text,
        'description': description.text,
        'imgUrl': URL!.toString(),
        'projectUrl': projectUrl.text,
      });
    } catch (e) {
      print(e);
    }
    callback;
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
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Edit ur project',
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
                controller: projectUrl,
                decoration: const InputDecoration(
                  hintText: 'new projectUrl',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  prefixIcon: Icon(
                    Icons.link,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        pickImg();
                      },
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Icon(Icons.image_rounded),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Text(
                              'from Gallery',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        createImg();
                      },
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            child: Icon(Icons.camera),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              'from Camera',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _edit();
                      title.clear();
                      description.clear();
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
          ]),
        ),
      ),
    );
  }
}
