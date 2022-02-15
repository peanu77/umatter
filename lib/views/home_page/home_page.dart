import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/db/auth/google_signin_auth_controller.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/controllers/home_page_controller/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  final user = users.id;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.title,
                      style: const TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      user,
                      style: const TextStyle(
                        fontSize: 20.0,
                        // letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                height: size.height * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xffC1D4F0),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: const Text(
                  'Minor Interventions',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.3,
                  ),
                ),
              ),

              /*  Interventions */
              // Discover
              _buildDiscover(size),
              // My Mood
              _buildMyMood(size),
              // Meditate
              _buildMeditate(size),
              // My Diary
              _buildMyDiary(size),

              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: const Text(
                  'Major Intervention',
                  style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              _buildProfessionalIntervention(size),
            ],
          ),
        ),
      ),
    );
  }

  /// The following build methods used to separate it from the Scaffold.
  _buildDiscover(Size _size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: kCardDiscover,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Discover",
                                style: TextStyle(
                                  letterSpacing: 1.3,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              child: Text(
                                controller.discoverDescript,
                                style: const TextStyle(
                                    fontSize: 16.0, letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          controller.kDiscoverImg,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () => Get.toNamed('/discover'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );

  _buildMyMood(Size _size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: kCardMyMood,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "My Mood",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  letterSpacing: 1.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              child: Text(
                                controller.myMoodDescript,
                                style: const TextStyle(
                                    fontSize: 16.0, letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          controller.kMyMoodImg,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () => Get.toNamed('/my_mood'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  _buildMeditate(Size _size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: kCardMeditate,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Meditate",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.3),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              child: Text(
                                controller.myMeditateDescript,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          controller.kMeditateImg,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () => Get.toNamed('/meditate'),
                      child: const Text('Let\'s Dive In'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  _buildMyDiary(Size _size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: kCardMyDiary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "My Diary",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              height: _size.height * 0.1,
                              child: Text(
                                controller.discoverDescript,
                                style: const TextStyle(
                                    fontSize: 16.0, letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          controller.kMyDiaryImg,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () => Get.toNamed('/my_diary'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: TextStyle(
                            letterSpacing: 1.3, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  _buildProfessionalIntervention(Size _size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: kCardCounsellor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: _size.width * 0.5,
                              child: Container(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: const Text(
                                  "Reach Out to a Licensed Professional",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              child: Text(
                                controller.counsellorDescript,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          controller.kCounsellorImg,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () => Get.toNamed('/counselor'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}
