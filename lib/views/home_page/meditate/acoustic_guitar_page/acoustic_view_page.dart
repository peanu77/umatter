import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/meditate/audio_file.dart';
import 'package:audioplayers/audioplayers.dart';

class AcousticViewPage extends StatefulWidget {
  final controller;
  final index;
  const AcousticViewPage({Key? key, this.controller, this.index})
      : super(key: key);

  @override
  State<AcousticViewPage> createState() => _AcousticViewPageState();
}

class _AcousticViewPageState extends State<AcousticViewPage> {
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Acoustic Guitar Therapy',
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
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
                widget.controller[widget.index].title,
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                widget.controller[widget.index].authorName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          AudioFilePage(
            musicPath: widget.controller[widget.index].music,
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
