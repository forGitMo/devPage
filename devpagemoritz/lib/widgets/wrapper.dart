import 'package:devpagemoritz/models/user.dart';
import 'package:devpagemoritz/pages/login_screen.dart';
import 'package:devpagemoritz/pages/project_screen.dart';
import 'package:devpagemoritz/pages/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUsers?>(context);
    if (user == null) {
      return LoginScreen();
    } else {
      return ProjectScreen();
    }
  }
}
