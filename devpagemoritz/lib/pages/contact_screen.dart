import 'package:flutter/material.dart';
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
          Container(
            height: 50,
          ),
          const Text(
            'headline',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text('Have any questions? Id love to hear from you.'),
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
                          onTap: () => {}, // _callNumber,
                          child: Container(
                            height: 100,
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
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 110,
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
                Expanded(
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
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
                                'Other',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Flexible(
                                child: Text(
                                  '+49 157 31125645',
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
