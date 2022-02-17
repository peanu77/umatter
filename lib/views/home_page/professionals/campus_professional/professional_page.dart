import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/professional_info.dart';

class CampusProfessionalsPage extends StatelessWidget {
  const CampusProfessionalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List of Campus Professionals',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 7,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: InkWell(
              onTap: () => Get.to(() => const CampusProfessionalsInfo()),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.orange.shade400,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: _size.height * 0.14,
                        child: Image.asset('assets/img/directories/cit.png'),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text("College of Information Technology")
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
