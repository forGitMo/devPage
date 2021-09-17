import 'package:devpagemoritz/models/project.dart';
import 'package:devpagemoritz/pages/project_detail_screen.dart';
import 'package:flutter/material.dart';

class ProjectItem extends StatefulWidget {
  static const routeName = '/projectDetail-screen';

  const ProjectItem({Key? key, required this.project}) : super(key: key);
  final Project project;

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  String imageUrl =
      'https://user-images.githubusercontent.com/1078012/56232171-0a7fcb00-6078-11e9-84d7-58994cef8d09.png';

  void selectProject(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) => ProjectDetailScreen(project: widget.project),
    ));
  }

  static const String title = 'project1';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectProject(context),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Image.network(
                        widget.project.imgUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        color: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          widget.project.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
