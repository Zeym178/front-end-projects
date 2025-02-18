import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_app_ui/pages/activity_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;

  void pressActivity() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff07101F),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _appBar(),
        body: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            _welcomeContainer(context),
            SizedBox(
              height: 15,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _activityContainer(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  _activityContainer(int index) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff1055C2),
                      Color(0xff7E63C0),
                    ],
                  ),
                ),
                height: 50,
                child: Text(
                  (index + 1 < 10 ? '0' : '') + (index + 1).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  // color: Colors.blue,
                  height: 50,
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('10 Exercises'),
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.green,
                alignment: Alignment.centerRight,
                height: 50,
                width: 50,
                child: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Container(
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _welcomeContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1055C2),
            Color(0xff7E63C0),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  'Lose weight is 30 days',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .6,
                margin: EdgeInsets.only(left: 15, bottom: 15),
                // color: Colors.red,
                child: Text('Everyday you have to mantain this roule'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  '3o days left',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 10, top: 15),
              child: Image.asset('assets/images/welcome_girl.png'),
            ),
          ),
        ],
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
