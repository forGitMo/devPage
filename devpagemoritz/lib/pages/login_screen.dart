import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/pages/project_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  showWarningtDialog(BuildContext context) {
    // set up the button
    Widget okButton = InkWell(
      child: Text("OK"),
      onTap: () {
        Navigator.of(context).pop(LoginScreen);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning"),
      content: Text("username or password is not correct!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = InkWell(
      child: Text("OK"),
      onTap: () {
        Navigator.of(context).pop(ProjectScreen);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("register message"),
      content: Text("u create a user"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final firebase = FirebaseFirestore.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  createUser() async {
    print('user created');
    try {
      await firebase.collection('user').doc().set({
        'email': email.text,
        'password': password.text,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: Colors.black87,
                  ),
                ),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                  prefixIcon: Icon(
                    Icons.vpn_key_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        if (email.text != "" && password.text != '') {
                          createUser();
                          showAlertDialog(context);
                        } else {
                          print('we need data to create a user');
                        }
                        email.clear();
                        password.clear();
                      },
                      child: Text(
                        'register',
                        style: TextStyle(color: Colors.black),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Row(children: [
                    InkWell(
                      onTap: () {
                        if (email.text == 'amelang.moritz@gmail.com' &&
                            password.text == 'trol1234') {
                          Navigator.of(context).pop(ProjectScreen);
                        }
                        showWarningtDialog(context);
                      },
                      child: Row(
                        children: [
                          Text('login'),
                          Icon(Icons.login),
                        ],
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
