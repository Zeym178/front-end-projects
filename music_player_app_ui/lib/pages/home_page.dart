import 'package:flutter/material.dart';
import 'package:music_player_app_ui/components/my_appbar.dart';
import 'package:music_player_app_ui/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int categorieIndex = 0;
  List categories = [
    "All",
    "Relax",
    "Sad",
    "Party",
    "Rock",
    "another",
    "another",
    "another",
    "another",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        title: Text('H O M E', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 10),
          _searchBar(context),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Select Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
                  // padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        categorieIndex == index
                            ? Theme.of(context).colorScheme.inversePrimary
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: (categorieIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.inversePrimary)
                          .withOpacity(.3),
                      onTap: () {
                        setState(() {
                          categorieIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              color:
                                  categorieIndex == index
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(
                                        context,
                                      ).colorScheme.inversePrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container _searchBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                cursorColor: Theme.of(context).colorScheme.inversePrimary,
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
              child: Center(child: Icon(Icons.tune)),
            ),
          ],
        ),
      ),
    );
  }
}
