import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/views/home_page/meditate/audio_file.dart';

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
        body: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.chevron_left),
                ),
                Text(
                  "Lofi Music",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Container(),
              ],
            ),
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
                child: Lottie.asset(widget.controller[widget.index].coverImg),
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
      ),
    );
  }
}
