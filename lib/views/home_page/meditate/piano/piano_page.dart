import 'package:flutter/material.dart';
import 'package:umatter/controllers/meditate_page_controller/piano_controller_page.dart';
import 'package:umatter/views/home_page/meditate/piano/piano_view_page.dart';

class PianoPage extends StatefulWidget {
  const PianoPage({Key? key}) : super(key: key);

  @override
  State<PianoPage> createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  final pianoController = PianoPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: pianoController.pianoPageInfo.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
          child: SizedBox(
            height: _size.height * 0.15,
            width: double.infinity,
            child: InkWell(
              onTap: () => PianoViewPage(
                pianoController: pianoController.pianoPageInfo,
                index: index,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                // TODO : Change this to Image
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        pianoController.pianoPageInfo[index].title,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
