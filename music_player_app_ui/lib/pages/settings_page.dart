import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app_ui/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'S E T T I N G S',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Dark Mode: '),
                  CupertinoSwitch(
                    value:
                        Provider.of<ThemeProvider>(
                          context,
                          listen: false,
                        ).isDark,
                    onChanged: (value) {
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
