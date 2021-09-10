import 'package:flutter/material.dart';

class ProjectItem extends StatelessWidget {
  String imageUrl =
      'https://user-images.githubusercontent.com/1078012/56232171-0a7fcb00-6078-11e9-84d7-58994cef8d09.png';
  String title = 'project1';

  static const routeName = '/projectDetail-screen';

  ProjectItem({Key? key}) : super(key: key);

  void selectProject(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(routeName, arguments: {});
  }

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
            topLeft: Radius.zero,
            topRight: Radius.zero,
          ),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.zero,
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
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
                        width: 250,
                        color: Colors.black45,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          title,
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
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: const Text('project.link'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
