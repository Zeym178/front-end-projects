import 'package:flutter/material.dart';
import 'package:health_app_ui/models/activity_model.dart';
import 'package:health_app_ui/pages/activity_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPressed = false;
  var activities = [];

  void getActivities() {
    activities = ActivityModel.getActivities();
  }

  @override
  void initState() {
    // TODO: implement initState
    getActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
          itemCount: activities.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _activityContainer(index);
          },
        ),
      ],
    );
  }

  _activityContainer(int index) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
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
                      Text(activities[index].exercises.toString() +
                          ' Exercises'),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ActivityPage(
                        activity: activities[index],
                      ),
                    ),
                  );
                },
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
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        '3o days left',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
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
}
