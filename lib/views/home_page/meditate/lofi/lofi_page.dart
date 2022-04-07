import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/views/home_page/meditate/audio_file.dart';
import 'package:umatter/views/home_page/meditate/music_card_widget.dart';

class LofiPage extends StatefulWidget {
  final index;
  final controller;
  const LofiPage({Key? key, this.index, this.controller}) : super(key: key);

  @override
  State<LofiPage> createState() => _LofiPageState();
}

class _LofiPageState extends State<LofiPage> {
  late AudioPlayer advancedPlayer;
  AudioCache audioCache = AudioCache();
  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Lofi',
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.grey[600],
                )),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0.0,
          ),
          body: musicCardWidget(
            height: _size.height * 0.45,
            width: double.infinity,
            imgAsset: '',
            title: widget.controller[widget.index].title,
            author: widget.controller[widget.index].authorName,
            advancedPlayer: advancedPlayer,
            audioCache: audioCache,
            musicPath: widget.controller[widget.index].music,
          )),
    );
  }
}
