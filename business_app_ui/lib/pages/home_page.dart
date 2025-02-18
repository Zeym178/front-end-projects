import 'package:business_app_ui/components/announcementBox.dart';
import 'package:business_app_ui/models/announcement_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Announcement> announcements = [];

  void getAnnouncements() {
    announcements = Announcement.getAnnouncements();
  }

  @override
  void initState() {
    // TODO: implement initState
    getAnnouncements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffF1C4FA),
            Color(0xff92CFDC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: kToolbarHeight + 100,
          leading: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: kToolbarHeight,
              width: kToolbarHeight,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Icon(Icons.drag_handle),
                ),
              ),
            ),
          ),
          actions: [
            Container(
              width: kToolbarHeight,
              height: kToolbarHeight,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.only(right: 20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Icon(Icons.account_circle),
                ),
              ),
            ),
            Container(
              width: kToolbarHeight,
              height: kToolbarHeight,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: BorderRadius.circular(50),
              ),
              margin: EdgeInsets.only(right: 20),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Icon(Icons.search),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _presentationBox(context),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: announcements.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Announcementbox(
                    announcement: announcements[index],
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _presentationBox(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Global partners',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .75,
            margin: EdgeInsets.only(left: 5),
            child: Text(
              'Agency that build many amazing product too boost your business to next level',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
