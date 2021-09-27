import 'package:devpagemoritz/pages/about_screen.dart';
import 'package:devpagemoritz/pages/contact_screen.dart';
import 'package:devpagemoritz/pages/impressum_screen.dart';
import 'package:devpagemoritz/pages/datenschutz_screen.dart';
import 'package:devpagemoritz/pages/urheberrechts_screen.dart';
import 'package:devpagemoritz/pages/login_screen.dart';
import 'package:devpagemoritz/pages/project_screen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              child: Image.asset(
                'lib/assets/images/project_manager.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Project-list'),
            onTap: () => {Navigator.of(context).pop(ProjectScreen)},
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text('Contact me'),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(ContactScreen.routeName, arguments: {})
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_box),
            title: const Text('About'),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(AboutScreen.routeName, arguments: {})
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: const Icon(Icons.textsms_outlined),
            title: const Text('Impressum'),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(ImpressumScreen.routeName, arguments: {})
            },
          ),
          ListTile(
            leading: const Icon(Icons.text_snippet),
            title: const Text('Urheberrecht'),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(UrheberechtsScreen.routeName, arguments: {})
            },
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('Datenschutz'),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(DatenschutzScreen.routeName, arguments: {})
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log out'),
            onTap: () => {
              Navigator.of(context).pushNamed('/LoginScreen', arguments: {})
            },
          ),
        ],
      ),
    );
  }
}
