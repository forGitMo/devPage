import 'package:devpagemoritz/pages/Datenschutz_screen.dart';
import 'package:devpagemoritz/pages/about_screen.dart';
import 'package:devpagemoritz/pages/contact_screen.dart';
import 'package:devpagemoritz/pages/impressum_screen.dart';
import 'package:devpagemoritz/pages/login_screen.dart';
import 'package:devpagemoritz/pages/project_detail_screen.dart';
import 'package:devpagemoritz/pages/urheberrechts_screen.dart';
import 'package:devpagemoritz/widgets/project_item.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ProjectScreen(),
        ProjectItem.routeName: (context) => ProjectDetailScreen(),
        ContactScreen.routeName: (context) => const ContactScreen(),
        AboutScreen.routeName: (context) => const AboutScreen(),
        ImpressumScreen.routeName: (context) => const ImpressumScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        UrheberechtsScreen.routeName: (context) => const UrheberechtsScreen(),
        DatenschutzScreen.routeName: (context) => const DatenschutzScreen(),
      },
    );
  }
}
