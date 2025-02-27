import 'package:flutter/material.dart';
import 'package:music_player_app_ui/models/song.dart';

class SongBox extends StatefulWidget {
  final Song song;
  const SongBox({super.key, required this.song});

  @override
  State<SongBox> createState() => _SongBoxState();
}

class _SongBoxState extends State<SongBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 130,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(widget.song.picturePath, fit: BoxFit.cover),
          ),
          Text(
            widget.song.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            widget.song.artistName,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
