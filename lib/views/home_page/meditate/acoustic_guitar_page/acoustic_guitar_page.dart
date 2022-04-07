import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/controllers/meditate_page_controller/acoustic_controller_page.dart';
import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_view_page.dart';

class AcousticGuitarPage extends StatefulWidget {
  const AcousticGuitarPage({Key? key}) : super(key: key);

  @override
  State<AcousticGuitarPage> createState() => _AcousticGuitarPageState();
}

class _AcousticGuitarPageState extends State<AcousticGuitarPage> {
  final controller = AcousticPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Acoustic Music',
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.chevron_left,
                color: Colors.grey[600],
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: ListView.builder(
            itemCount: controller.acousticPageController.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
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
                          builder: (context) => AcousticViewPage(
                            controller: controller.acousticPageController,
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
                                  controller
                                      .acousticPageController[index].title,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey[800],
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                Text(
                                  controller
                                      .acousticPageController[index].authorName,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          backgroundColor: Colors.grey[100]),
    );
  }
}
