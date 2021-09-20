import 'package:devpagemoritz/controller/project_controller.dart';
import 'package:devpagemoritz/models/project.dart';
import 'package:devpagemoritz/pages/project_detail_screen.dart';
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
      body: SingleChildScrollView(
        child: FutureBuilder<List<Project>>(
          future: ProjectController.loadAllProject(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProjectItem(project: snapshot.data![index]);
                },
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
