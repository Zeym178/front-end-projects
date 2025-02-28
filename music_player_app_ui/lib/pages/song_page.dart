import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:music_player_app_ui/models/player.dart';
import 'package:music_player_app_ui/models/song.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  final Song song;
  const SongPage({super.key, required this.song});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Player>(context, listen: false).startSong(widget.song.songPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 40,
            height: 40,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Icon(Icons.more_horiz)),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 280,
              width: 280,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(right: 20, left: 20, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.asset(widget.song.picturePath, fit: BoxFit.cover),
            ),
          ),
          Text(
            widget.song.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            widget.song.artistName,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Lyrics\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(loremIpsum(words: 100), textAlign: TextAlign.center),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).colorScheme.surface,
                        Theme.of(context).colorScheme.surface.withOpacity(.1),
                        Theme.of(context).colorScheme.surface,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Consumer<Player>(
            builder: (context, value, child) {
              return Container(
                // color: Colors.red,
                child: SliderTheme(
                  data: SliderThemeData(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                    thumbColor: Theme.of(context).colorScheme.inversePrimary,
                    activeTrackColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    inactiveTrackColor: Theme.of(
                      context,
                    ).colorScheme.inversePrimary.withOpacity(.5),
                  ),
                  child: Slider(
                    min: 0,
                    max: value.totalDuration.inSeconds.toDouble(),
                    value: value.currentDuration.inSeconds.toDouble(),
                    onChangeEnd: (double dur) {
                      value.seekPosition(Duration(seconds: dur.toInt()));
                    },
                    onChanged: (double value) {},
                  ),
                ),
              );
            },
          ),
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  width: 40,
                  height: 40,
                  child: Icon(Icons.shuffle),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  width: 60,
                  child: Icon(Icons.skip_previous),
                ),
                Consumer<Player>(
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () {
                        value.playOrPause();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child:
                            value.isPlaying
                                ? Icon(Icons.pause)
                                : Icon(Icons.play_arrow),
                      ),
                    );
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Icon(Icons.skip_next),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  height: 40,
                  width: 40,
                  child: Icon(Icons.repeat),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
