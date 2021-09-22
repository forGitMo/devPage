import 'package:devpagemoritz/controller/project_controller.dart';
import 'package:devpagemoritz/models/project.dart';
import 'package:devpagemoritz/pages/input_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/project_item.dart';
import '../widgets/nav_drawer.dart';

class ProjectScreen extends StatefulWidget {
  static const routeName = '/projectDeatils-screen';
  ProjectScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  final List<Project> _Projects = [];

  _addNewProject(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: InputScreen(
            Project(
              id: '',
              title: '',
              description: '',
              imgUrl: '',
              projectUrl: '',
            ),
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

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
      body: FutureBuilder<List<Project>>(
        future: ProjectController.loadAllProject(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProjectItem(
                  project: snapshot.data![index],
                  onDelteChange: () => setState(
                    () => print('reload'),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _addNewProject(context),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
