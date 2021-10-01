import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:devpagemoritz/models/project.dart';
import 'package:devpagemoritz/pages/project_screen.dart';

class InputScreen extends StatefulWidget {
  InputScreen(this.project);
  final Project project;
  var storage = FirebaseFirestore.instance;

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
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

  TextEditingController projectUrl = TextEditingController();

  final firebase = FirebaseFirestore.instance;
  late final VoidCallback callback;
  var URL;
  //dowload from storage
  downloadStorage() async {
    await firebase_storage.FirebaseStorage.instance
        .ref('images/img' + '$time')
        .getDownloadURL()
        .then((url) {
      this.URL = url;
      print('Storage url:' + URL);
    });
  }

  //create projects
  createData() async {
    try {
      var headline = title.text;
      String subheadline = description.text;
      String ProjectUrl = projectUrl.text;
      await downloadStorage();
      firebase.collection('projects').doc().set({
        'title': headline,
        'description': subheadline,
        'imgUrl': URL!.toString(),
        'projectUrl': ProjectUrl,
      });
      callback;
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
                child: image != null
                    ? Image.file(
                        File(image!.path),
                        scale: 13,
                      )
                    : FlutterLogo(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: title,
                  decoration: const InputDecoration(
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
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: description,
                  decoration: const InputDecoration(
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
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: projectUrl,
                  decoration: const InputDecoration(
                    hintText: 'projectUrl',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.folder_open_outlined,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(
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
                    SizedBox(
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
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  createData();
                  title.clear();
                  description.clear();
                  projectUrl.clear();
                  Navigator.of(context).pushNamed('/', arguments: {});
                },
                child: const Text(
                  'create',
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
