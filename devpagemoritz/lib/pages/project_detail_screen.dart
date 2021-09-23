import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({Key? key, required this.project})
      : super(key: key);
  final Project project;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  void launchURL() async => await canLaunch(widget.project.projectUrl)
      ? await launch(widget.project.projectUrl)
      : throw 'Could not launch url';

  updateData() {
    FirebaseFirestore.instance
        .collection('projects')
        .doc()
        .update(widget.project.toMap())
        .whenComplete(() => print('updated'))
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('project details'),
      ),
      body: SingleChildScrollView(
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline2!,
          textAlign: TextAlign.center,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  widget.project.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Colors.black45),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  child: Image.network(widget.project.imgUrl),
                  elevation: 5,
                ),
              ),
              Container(
                width: 350,
                child: const Text(
                  'description:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: Text(
                  widget.project.description,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                child: TextButton(
                  child: const Text('link to project repo'),
                  onPressed: launchURL,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
