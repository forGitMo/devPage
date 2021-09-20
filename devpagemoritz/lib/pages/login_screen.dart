import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 110,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 40),
              ),
            ),
            TextField(
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
                    onPressed: () {},
                    child: Text(
                      'register',
                      style: TextStyle(color: Colors.black),
                    )),
                SizedBox(
                  width: 10,
                ),
                Row(children: [
                  TextButton(
                    onPressed: () {},
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
    );
  }
}
