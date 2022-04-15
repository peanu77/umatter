import 'package:flutter/material.dart';
import 'package:umatter/controllers/meditate_page_controller/piano_controller_page.dart';
import 'package:umatter/views/home_page/meditate/music_card_list_widget.dart';
import 'package:umatter/views/home_page/meditate/piano/piano_view_page.dart';

class PianoPage extends StatefulWidget {
  const PianoPage({Key? key}) : super(key: key);

  @override
  State<PianoPage> createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  final controller = PianoPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Piano",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey[700],
            letterSpacing: 1.0,
          ),
        ),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[600],
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: controller.pianoPageInfo.length,
        itemBuilder: (context, index) => TextButton(
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PianoViewPage(
                controller: controller.pianoPageInfo,
                index: index,
              ),
            ),
          ),
          child: musicCardListWidget(
            title: controller.pianoPageInfo[index].title,
            author: controller.pianoPageInfo[index].authorName,
            size: _size,
            context: context,
            controller: controller,
            index: index,
          ),
        ),
      ),
    );
  }
}
