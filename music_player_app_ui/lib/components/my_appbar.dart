import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  const MyAppbar({super.key, this.title});

  @override
  State<MyAppbar> createState() => _MyAppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      centerTitle: true,
      actions: [
        // Container(
        //   height: 40,
        //   width: 40,
        //   margin: EdgeInsets.only(right: 20),
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).colorScheme.primary,
        //     borderRadius: BorderRadius.circular(20),
        //   ),
        //   child: Center(child: Icon(Icons.notifications_outlined)),
        // ),
        Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(right: 15),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: Center(
            child: Image.asset('assets/images/profile.png', fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
