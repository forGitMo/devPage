import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'dart:async';

//import 'package:flutter/services.dart';
//import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);
  static const routeName = '/contact-screen';

  /* _callNumber() async {
    const number = '015731125645'; //set the number here
    bool res = await FlutterPhoneDirectCaller.callNumber(number);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact me'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          const Text(
            'headline',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          const Text(
            'Have any questions? \n I would love to hear from you.',
            textAlign: TextAlign.center,
          ),
          Container(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () =>
                              launch("tel://015731125645"), // _callNumber,
                          child: Container(
                            height: 120,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.call,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Call me',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Flexible(
                                  child: Text('+49 157 31125645',
                                      style: TextStyle(fontSize: 10),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => launch("mailto:amelang.moritz@gmail.com"),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 130,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.email,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Write me',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Flexible(
                                  child: Text(
                                    'amelang.moritz@gmail.com',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => launch('https://github.com/forGitMo'),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 120,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 24,
                                  ),
                                ),
                                Text(
                                  'Github',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Flexible(
                                  child: Text(
                                    'forGitMo',
                                    style: TextStyle(fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
