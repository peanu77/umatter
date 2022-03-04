import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/home_page_controller/constant.dart';
import 'package:umatter/controllers/home_page_controller/home_page_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection('user_info');
    _collectionRef.doc('users').collection('user_info').id;
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
              future: _collectionRef.get(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello There!",
                            // controller.title,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          // TODO: Change this to username
                          Text(
                            "Ricardo Dalisay",
                            style: TextStyle(
                              fontSize: 20.0,
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
                );
              }),
        ),
      ),
    );
  }

  /// The following build methods used to separate it from the Scaffold.
  _buildDiscover(Size _size) => Column(
        children: [
          Padding(
            padding: kHomeCardPadding,
            child: Card(
              color: kCardDiscover,
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
                                "Discover",
                                style: kHomeTitleStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              child: const Text(
                                discoverDescript,
                                style: TextStyle(
                                    fontSize: 16.0, letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          kDiscoverImg,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kHomeButton,
                      onPressed: () => Get.toNamed('/discover'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: kHomeCardStyle,
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
            padding: kHomeCardPadding,
            child: Card(
              color: kCardMeditate,
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
                                "Meditate",
                                style: kHomeTitleStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              child: const Text(
                                myMeditateDescript,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          kMeditateImg,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kHomeButton,
                      onPressed: () => Get.toNamed('/meditate'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: kHomeCardStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  _buildMyDiary(Size _size) => Column(
        children: [
          Padding(
            padding: kHomeCardPadding,
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
                                style: kHomeTitleStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: _size.width * 0.5,
                              height: _size.height * 0.1,
                              child: const Text(
                                discoverDescript,
                                style: TextStyle(
                                    fontSize: 16.0, letterSpacing: 1.0),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          kMyDiaryImg,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kHomeButton,
                      onPressed: () => Get.toNamed('/my_diary'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: kHomeCardStyle,
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
            padding: kHomeCardPadding,
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
                              child: const Text(
                                counsellorDescript,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          kCounsellorImg,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kHomeButton,
                      onPressed: () => Get.toNamed('/counselor'),
                      child: const Text(
                        'Let\'s Dive In',
                        style: kHomeCardStyle,
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
