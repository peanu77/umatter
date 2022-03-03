import 'package:flutter/material.dart';
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
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: controller.acousticPageController.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: SizedBox(
                  height: _size.height * 0.15,
                  width: double.infinity,
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AcousticViewPage(
                            controller: controller.acousticPageController,
                            index: index,
                          ),
                        )),
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
                              controller.acousticPageController[index].title,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
