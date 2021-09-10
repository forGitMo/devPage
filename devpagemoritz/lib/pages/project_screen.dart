import 'package:flutter/material.dart';
import '../widgets/project_item.dart';

class ProjectScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const ProjectScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('project Overview'),
      ),
      body: Column(
        children: <Widget>[
          ProjectItem(),
        ],
      ),
    );
  }
}
