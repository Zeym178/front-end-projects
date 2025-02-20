import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool goBack;
  const myAppBar({super.key, required this.title, required this.goBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leadingWidth: 100,
      scrolledUnderElevation: 0,
      leading: Row(
        children: [
          Visibility(
            visible: goBack,
            child: Align(
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 10,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !goBack,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 40,
                width: 40,
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Color(0xff07101F),
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: Ink.image(
                    image: AssetImage('assets/images/profile.png'),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
