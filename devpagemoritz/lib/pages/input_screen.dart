import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  const InputScreen();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            children: const [Text('data')],
          ),
        ),
      ),
    );
  }
}
