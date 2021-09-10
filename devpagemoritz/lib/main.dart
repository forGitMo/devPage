import 'package:devpagemoritz/pages/projectDetail_screen.dart';
import 'package:devpagemoritz/widgets/project_item.dart';
import 'package:flutter/material.dart';
import 'pages/project_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProjectScreen(),
        ProjectItem.routeName: (context) => const ProjectDetailScreen(),
      },
    );
  }
}
