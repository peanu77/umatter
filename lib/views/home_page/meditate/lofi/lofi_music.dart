import 'package:flutter/material.dart';
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
          color: Colors.black,
        ),
        title: const Text(
          'Lofi',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            letterSpacing: 1.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
                    ),
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
                            controller.lofiPageInfo[index].title,
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
    );
  }
}
