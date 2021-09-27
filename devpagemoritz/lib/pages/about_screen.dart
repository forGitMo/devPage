import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);
  static const routeName = '/about-screen';
  static launchURL() async => await canLaunch('https://github.com/forGitMo')
      ? await launch('https://github.com/forGitMo')
      : throw 'Could not launch url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(50),
              width: double.infinity,
              child: Center(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: const CircleAvatar(
                        radius: 35.0,
                        backgroundColor: Colors.deepPurple,
                        backgroundImage: NetworkImage(
                            'https://yt3.ggpht.com/ytc/AAUvwnhYSxHrN2tiu9XjRPw4JUigbINQbLZKe9TXqi7Gqw=s900-c-k-c0x00ffffff-no-rj'),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      child: const Text(
                        'Mortiz \nAmelang',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Im a developer',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text('based in Germany'),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'I prefer programming websites or apps. I have experience in the frameworks flutter and vue.js. I also know how to work with HTML, CSS and JS. Furthermore, I am entrusted with handling git',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
