import 'package:flutter/material.dart';
import 'package:music_player_app_ui/pages/settings_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Icon(Icons.music_note)),
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('H O M E'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SettingsPage();
                    },
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('S E T T I N G S'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
