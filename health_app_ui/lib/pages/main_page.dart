import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_app_ui/pages/activity_page.dart';
import 'package:health_app_ui/pages/home_page.dart';

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
    ActivityPage(),
    ActivityPage(),
    ActivityPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff07101F),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        appBar: _appBar(),
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

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      scrolledUnderElevation: 0,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.3),
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 10,
            ),
          ),
        ),
      ),
      actions: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 40,
            width: 40,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {},
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
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
