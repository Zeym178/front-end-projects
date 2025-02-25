import 'package:flutter/material.dart';
import 'package:music_player_app_ui/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('H O M E', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        fillColor: Theme.of(context).colorScheme.primary,
                        filled: true,
                        hintText: 'Search for..',
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Icon(Icons.settings)),
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
