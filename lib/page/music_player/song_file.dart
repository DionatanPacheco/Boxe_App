import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class SongFile extends StatefulWidget {
  SongFile({Key? key, required this.advancedPlayer}) : super(key: key);
  AudioPlayer advancedPlayer;
  @override
  State<SongFile> createState() => _SongFileState();
}

class _SongFileState extends State<SongFile> {
  Duration _duration = const Duration();
  Duration _position = const Duration();
  final String path =
      'https://archive.org/download/IGM-V7/IGM%20-%20Vol.%207/25%20Diablo%20-%20Tristram%20%28Blizzard%29.mp3';
  bool isplaying = false;
  bool ispaused = false;
  bool isloop = false;
  final List<IconData> _icons = [
    Icons.play_circle_outlined,
    Icons.pause_circle_outline_outlined
  ];
  @override
  void initState() {
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
      widget.advancedPlayer.onPositionChanged.listen((p) {
        setState(() {
          _position = p;
        });
      });
    });
    widget.advancedPlayer.setSourceUrl(path);
  }

  Widget buttonStart() {
    //isPlaying=bool;
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isplaying == false
          ? Icon(_icons[0])
          : Icon(
              _icons[1],
            ),
      onPressed: () {
        if (isplaying == false) {
          widget.advancedPlayer.play;
          setState(() {
            isplaying = true;
          });
        } else if (isplaying == true) {
          widget.advancedPlayer.pause();
          setState(() {
            isplaying == false;
          });
        }
      },
    );
  }

  Widget loadAsset() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [buttonStart()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [],
          ),
        ),
        loadAsset()
      ],
    );
  }
}
