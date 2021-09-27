import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/pages/project_screen.dart';
import 'package:devpagemoritz/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

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

  final _formKey = GlobalKey<FormState>();
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

  var err = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 160,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: email,
                    validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                    onChanged: (val) {
                      setState(() {
                        email.text = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Text(
                    err,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextFormField(
                    controller: password,
                    validator: (val) =>
                        val!.length <= 6 ? 'Enter an password >= 6' : null,
                    obscureText: true,
                    onChanged: (val) {
                      password.text = val;
                    },
                    decoration: const InputDecoration(
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
                          onPressed: () async {
                            Navigator.of(context)
                                .pushReplacementNamed('/RegisterScreen');
                            email.clear();
                            password.clear();
                          },
                          child: Row(
                            children: const [
                              Text(
                                'register',
                                style: TextStyle(color: Colors.black),
                              ),
                              Icon(
                                Icons.supervised_user_circle,
                                color: Colors.black,
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Row(children: [
                        InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result =
                                  await _auth.signInWhithEmailAndPassword(
                                      email.text, password.text);
                              if (result == null) {
                                setState(() {
                                  err =
                                      'Could not sign in with those cedentials';
                                  email.clear();
                                  password.clear();
                                });
                              } else {
                                Navigator.of(context).pushReplacementNamed('/');
                                err = '';
                              }

                              email.clear();
                              password.clear();
                            }
                          },
                          child: Row(
                            children: const [
                              Text('login'),
                              Icon(Icons.login),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('error to signing in');
                            } else {
                              print('signing in.. ');
                              print(result.uid);
                              Navigator.of(context).pushReplacementNamed('/');
                            }
                          },
                          child: Row(
                            children: const [
                              Text('login anon'),
                              Icon(Icons.follow_the_signs_outlined),
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
        ),
      ),
    );
  }
}
