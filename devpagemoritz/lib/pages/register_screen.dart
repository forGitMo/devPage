import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devpagemoritz/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _Register createState() => _Register();
}

class _Register extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  var err = '';
  final firebase = FirebaseFirestore.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 160,
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: email,
                  validator: (val) => val!.isEmpty ? 'Enter an Email' : null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    err,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  validator: (val) =>
                      val!.length <= 6 ? 'Enter an password >= 6' : null,
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
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
                        if (_formKey.currentState!.validate()) {
                          debugPrint(email.text);
                          debugPrint(password.text);

                          dynamic result =
                              await _auth.registerWhithEmailAndPassword(
                            email.text,
                            password.text,
                          );
                          if (result == null) {
                            setState(() {
                              err = 'please supply a valid email';
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
                          Text(
                            'register',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.supervised_user_circle,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/LoginScreen');
                      },
                      child: Row(
                        children: const [
                          Text('back 2 login'),
                          Icon(Icons.login),
                        ],
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
