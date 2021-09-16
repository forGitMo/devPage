import 'package:flutter/material.dart';
import '../widgets/project_item.dart';
import '../widgets/nav_drawer.dart';

class ProjectScreen extends StatelessWidget {
  static const routeName = '/projectDeatils-screen';

  const ProjectScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          'project Overview',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: const <Widget>[
          ProjectItem(),
        ],
      ),
    );
  }
}
