import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/models/project.dart';
import 'package:devpagemoritz/pages/project_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatelessWidget {
  static const routeName = '/projectDetail-screen';
  final Function() onDelteChange;
  final Project project;
  ProjectItem({
    required this.onDelteChange,
    required this.project,
  });

  String imageUrl =
      'https://user-images.githubusercontent.com/1078012/56232171-0a7fcb00-6078-11e9-84d7-58994cef8d09.png';

  void selectProject(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) => ProjectDetailScreen(project: project),
    ));
  }

  void launchURL() async => await canLaunch(project.projectUrl)
      ? await launch(project.projectUrl)
      : throw 'Could not launch url';

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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.black26),
            ),
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
                        project.imgUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      right: 10,
                      child: Container(
                        color: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          project.title,
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
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: TextButton(
                        child: const Text('link to project repo'),
                        onPressed: launchURL,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .doc(
                                        'projects/${project.id}') // <-- Doc ID to be deleted.
                                    .delete() // <-- Delete
                                    .then((_) {
                                  print('Deleted');
                                  //
                                  onDelteChange();
                                }).catchError((error) =>
                                        print('Delete failed: $error'));
                              },
                              child: Card(
                                color: Color.fromRGBO(255, 0, 0, 0.6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.delete_forever_rounded,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Text(
                                        'delete',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {
                                print('edit');
                                onDelteChange();
                              },
                              child: Card(
                                color: Color.fromRGBO(0, 0, 255, 0.6),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      Text(
                                        'edit',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
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
