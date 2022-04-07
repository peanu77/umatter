import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/controllers/meditate_page_controller/lofi_page_controller.dart';
import 'package:umatter/views/home_page/meditate/lofi/lofi_page.dart';

class LofiMusicPage extends StatelessWidget {
  const LofiMusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final controller = LofiPageController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.chevron_left),
          color: Colors.grey[600],
        ),
        title: Text(
          'Lofi',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 20.0,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          itemCount: controller.lofiPageInfo.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1.0,
                child: SizedBox(
                  height: _size.height * 0.12,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LofiPage(
                          controller: controller.lofiPageInfo,
                          index: index,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Title
                              Text(
                                controller.lofiPageInfo[index].title,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey[800],
                                  letterSpacing: 1.0,
                                ),
                              ),
                              Text(
                                controller.lofiPageInfo[index].authorName,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[600],
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/img/music_therapy/music_track.svg',
                            height: 50.0,
                            color: Colors.grey
                            [600],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
