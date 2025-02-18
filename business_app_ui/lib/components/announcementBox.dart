import 'package:business_app_ui/models/announcement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Announcementbox extends StatefulWidget {
  final Announcement announcement;
  const Announcementbox({super.key, required this.announcement});

  @override
  State<Announcementbox> createState() => _AnnouncementboxState();
}

class _AnnouncementboxState extends State<Announcementbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
        color: Color(0xffE6D8FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .3,
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  widget.announcement.announcement,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.announcement.amount,
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(top: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.4),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_outward,
                      size: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.only(right: 30),
                child: SvgPicture.asset(
                  widget.announcement.iconPath,
                  width: 60,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
