import 'package:flutter/material.dart';

class ProjectItem extends StatefulWidget {
  static const routeName = '/projectDetail-screen';

  const ProjectItem({Key? key}) : super(key: key);

  @override
  State<ProjectItem> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  String imageUrl =
      'https://user-images.githubusercontent.com/1078012/56232171-0a7fcb00-6078-11e9-84d7-58994cef8d09.png';

  void selectProject(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProjectItem.routeName, arguments: {});
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
                        imageUrl,
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
                        child: const Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
