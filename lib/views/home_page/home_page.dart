import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:umatter/controllers/home_page_controller/constant.dart';
import 'package:umatter/controllers/home_page_controller/home_page_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/preferences/consts.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';
import 'package:umatter/views/user_info_page/user_info_page.dart';
import 'package:umatter/preferences/run_preferences.dart';
import 'package:umatter/views/welcome_page/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyOne = GlobalKey();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
        (timeStamp) => ShowCaseWidget.of(context)?.startShowCase([
              keyOne,
            ]));
  }

// Check Daytime
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    final _runPreferences = RunPreferences();
    final size = MediaQuery.of(context).size;
    String name = '';
    name = SharePrefConfig.getUsername() ?? "";
    return Scaffold(
      backgroundColor: kHomeBgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: StreamBuilder<QuerySnapshot>(builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greeting(),
                        style: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: kPrimaryFrmColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                _buildAssessment(size, _runPreferences),

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
  _buildAssessment(Size _size, RunPreferences runPreferences) => Showcase(
        description: "Assessment Page",
        key: keyOne,
        child: Column(
          children: [
            Padding(
              padding: kHomeCardPadding,
              child: Card(
                color: kCardAssessment,
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
                                  "Assessment",
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
                                    fontSize: 16.0,
                                    letterSpacing: 1.0,
                                    color: Color(0xffefedfa),
                                  ),
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
                        onPressed: () async {
                          bool firstAssessment = await runPreferences
                              .getFirstRun(assessmentRunKey);
                          if (firstAssessment) {
                            // runPreferences.disableFirstRun(assessmentRunKey);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const UserInfo(),
                                // builder: (context) => const WelcomePage(),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const WelcomePage(),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          'Take Assessment',
                          style: kHomeCardStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
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
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                  color: kCardContent,
                                ),
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
                                  color: kCardContent,
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
                                  fontSize: 16.0,
                                  letterSpacing: 1.0,
                                  color: kCardContent,
                                ),
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
                                    color: Colors.white,
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
                                  color: kCardContent,
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
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProfessionalDirectoriesPage(),
                        ),
                      ),
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
