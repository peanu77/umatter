import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:umatter/views/home_page/meditate/audio_file.dart';

class PianoViewPage extends StatefulWidget {
  final pianoController;
  final index;
  const PianoViewPage({Key? key, this.pianoController, this.index})
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
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: _size.height * 0.45,
              width: double.infinity,
              // child: Lottie.asset(widget.controller[widget.index].coverImg),
            ),
          ),
          const Spacer(),
          Column(
            children: [
              Text(
                widget.pianoController[widget.index].title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                widget.pianoController[widget.index].authorName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          AudioFilePage(
            musicPath: widget.pianoController[widget.index].music,
            advancePlayer: advancedPlayer,
            audioCache: audioCache,
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
