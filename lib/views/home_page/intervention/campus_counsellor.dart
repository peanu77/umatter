import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CampushCounsellor extends StatelessWidget {
  const CampushCounsellor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intervention'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: 7,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                // TODO : Edit this
                onPressed: () {},
                child: Container(
                  width: _size.width * 0.35,
                  height: _size.height * 0.9,
                  child: Column(
                    children: [
                      Image.asset('assets/img/intervention_img/cit.png'),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Ms. Therese Palacpac',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
