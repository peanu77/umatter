import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../music_card_widget.dart';

class PianoViewPage extends StatefulWidget {
  final controller;
  final index;
  const PianoViewPage({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  State<PianoViewPage> createState() => _PianoViewPageState();
}

class _PianoViewPageState extends State<PianoViewPage> {
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
        ),
      ),
    );
  }
}
