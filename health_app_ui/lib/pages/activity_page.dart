import 'package:flutter/material.dart';
import 'package:health_app_ui/components/myappbar.dart';
import 'package:health_app_ui/models/activity_model.dart';

class ActivityPage extends StatefulWidget {
  final ActivityModel activity;
  const ActivityPage({super.key, required this.activity});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff07101F),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: myAppBar(
          title: widget.activity.title,
          goBack: true,
        ),
        body: ListView(
          children: [
            Container(
              child: Image.asset(
                'assets/images/yoga_girl.png',
                height: 180,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xff142239),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff142844),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Duration'),
                            Text(widget.activity.duration)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Instructions',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.activity.explanation,
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Focus Area in Body',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 25,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.activity.tags.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(widget.activity.tags[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset('assets/images/bodies.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
