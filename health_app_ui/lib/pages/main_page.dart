import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_app_ui/pages/aux1.dart';
import 'package:health_app_ui/pages/history_page.dart';
import 'package:health_app_ui/pages/home_page.dart';
import 'package:health_app_ui/components/myappbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavIndex = 0;

  final bottomItems = [
    bottomItemContainer(iconItem: Icon(Icons.home)),
    bottomItemContainer(iconItem: Icon(Icons.monitor_heart)),
    bottomItemContainer(iconItem: Icon(Icons.list_alt)),
    bottomItemContainer(iconItem: Icon(Icons.person)),
  ];

  final bodies = [
    HomePage(),
    aux1(),
    HistoryPage(),
    aux1(),
  ];

  final titles = ['Home', '...', 'History', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff07101F),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: myAppBar(
          title: titles[bottomNavIndex],
          goBack: false,
        ),
        body: bodies[bottomNavIndex],
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 300),
          buttonBackgroundColor: Color(0xff162C4B),
          color: Color(0xff162C4B),
          index: bottomNavIndex,
          backgroundColor: Colors.white.withOpacity(.1),
          items: bottomItems,
          onTap: (value) => setState(() {
            bottomNavIndex = value;
          }),
        ),
      ),
    );
  }
}

class bottomItemContainer extends StatelessWidget {
  final Icon iconItem;
  const bottomItemContainer({super.key, required this.iconItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1055C2),
            Color(0xff7E63C0),
          ],
        ),
        shape: BoxShape.circle,
      ),
      child: iconItem,
    );
  }
}
