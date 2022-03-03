import 'package:flutter/material.dart';
import 'package:umatter/controllers/meditate_page_controller/lofi_page_controller.dart';
import 'package:umatter/views/home_page/meditate/lofi_page.dart';

class LofiMusicPage extends StatelessWidget {
  const LofiMusicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final controller = LofiPageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lofi'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: controller.lofiPageInfo.length,
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
                        builder: (context) => LofiPage(
                          controller: controller.lofiPageInfo,
                          index: index,
                        ),
                      )),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.orange,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        controller.lofiPageInfo[index].title,
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
