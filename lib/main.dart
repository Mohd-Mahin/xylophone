import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'getKeys.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  List<GetKeys> xylophoneKeys = [
    GetKeys(audioNote: 1, color: Colors.purple),
    GetKeys(audioNote: 2, color: Colors.deepOrange),
    GetKeys(audioNote: 3, color: Colors.amberAccent),
    GetKeys(audioNote: 4, color: Colors.tealAccent),
    GetKeys(audioNote: 5, color: Colors.blueAccent),
    GetKeys(audioNote: 6, color: Colors.green[400]),
    GetKeys(audioNote: 7, color: Colors.redAccent)
  ];

  Widget getKeys(int audioNote, Color color) {
    return Expanded(
      child: FlatButton(
          onPressed: () {
            final assetAudioPlayer = AssetsAudioPlayer();
            assetAudioPlayer.open(Audio("assets/sound/note${audioNote}.wav"));
          },
          color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: xylophoneKeys
              .map((xylophoneKey) =>
                  getKeys(xylophoneKey.audioNote, xylophoneKey.color))
              .toList(),
        ),
      ),
    );
  }
}
