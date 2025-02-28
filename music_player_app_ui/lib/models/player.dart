import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Player extends ChangeNotifier {
  final AudioPlayer _audioplayer = AudioPlayer();
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  Player() {
    listenToDuration();
  }

  void startSong(String audioPath) async {
    await _audioplayer.stop();
    await _audioplayer.play(AssetSource(audioPath));
    _isPlaying = true;
    notifyListeners();
  }

  void pauseSong() async {
    await _audioplayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async {
    await _audioplayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void playOrPause() async {
    if (_isPlaying) {
      pauseSong();
    } else {
      resume();
    }
  }

  void seekPosition(Duration newpos) async {
    await _audioplayer.seek(newpos);
    notifyListeners();
  }

  void listenToDuration() {
    _audioplayer.onDurationChanged.listen((newduration) {
      _totalDuration = newduration;
      notifyListeners();
    });

    _audioplayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioplayer.onPlayerComplete.listen((value) {
      _currentDuration = Duration.zero;
      notifyListeners();
    });
  }
}
