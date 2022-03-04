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
      body: Stack(
        children: [
          GridView.builder(
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
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        SizedBox(
                          height: _size.height * 0.14,
                          child: Image.asset('assets/img/directories/cit.png'),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          height: 40.0,
                          width: double.infinity,
                          color: Colors.green,
                          child: Text(
                            "College of Information Technology",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
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
        ],
      ),
    );
  }
}
