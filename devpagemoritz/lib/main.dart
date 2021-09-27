import 'package:devpagemoritz/models/user.dart';
import 'package:devpagemoritz/pages/Datenschutz_screen.dart';
import 'package:devpagemoritz/pages/about_screen.dart';
import 'package:devpagemoritz/pages/contact_screen.dart';
import 'package:devpagemoritz/pages/impressum_screen.dart';
import 'package:devpagemoritz/pages/login_screen.dart';
import 'package:devpagemoritz/pages/register_screen.dart';

import 'package:devpagemoritz/pages/urheberrechts_screen.dart';
import 'package:devpagemoritz/services/auth.dart';
import 'package:devpagemoritz/widgets/wrapper.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/project_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUsers?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DevPage',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Wrapper(),
          '/RegisterScreen': (context) => Register(),
          '/PojectScreen': (context) => ProjectScreen(),
          ContactScreen.routeName: (context) => const ContactScreen(),
          AboutScreen.routeName: (context) => const AboutScreen(),
          ImpressumScreen.routeName: (context) => const ImpressumScreen(),
          '/LoginScreen': (context) => const LoginScreen(),
          UrheberechtsScreen.routeName: (context) => const UrheberechtsScreen(),
          DatenschutzScreen.routeName: (context) => const DatenschutzScreen(),
        },
      ),
    );
  }
}
