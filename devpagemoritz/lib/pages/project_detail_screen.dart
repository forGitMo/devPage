import 'package:flutter/material.dart';

class ProjectDetailScreen extends StatelessWidget {
  String imageUrl =
      'https://user-images.githubusercontent.com/1078012/56232171-0a7fcb00-6078-11e9-84d7-58994cef8d09.png';

  ProjectDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('project item')),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(' '),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text('Project Description'),
                  const Text(
                    'linkt to Project',
                    style: TextStyle(color: Colors.lightBlue),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
