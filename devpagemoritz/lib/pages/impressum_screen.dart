import 'package:devpagemoritz/controller/impressum_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ImpressumScreen extends StatelessWidget {
  const ImpressumScreen({Key? key}) : super(key: key);
  static const routeName = '/impressum-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impressum'),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: FutureBuilder<String>(
            future: ImpressumController.loadImpressumById('Impressum'),
            builder: (context, snapshot) {
              return Markdown(
                  data: snapshot.hasData && snapshot.data != null
                      ? snapshot.data!
                      : '',
                  styleSheet: MarkdownStyleSheet(
                      blockSpacing: 2,
                      h1: const TextStyle(
                          height: 1,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      p: const TextStyle(
                        height: 1,
                      )));
            }),
      ),
    );
  }
}
