import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/utils/daytime_checker.dart';
import 'package:umatter/utils/widgets/home_page_card_widget.dart';
import 'package:umatter/views/home_page/assessment_page/assessment_disclaimer.dart';

import '../../controllers/home_page_controller/home_page_controller.dart';
import '../../preferences/run_preferences.dart';

import 'get_user_information_page/get_user_data_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyOne = GlobalKey();
  final _dayTimeChecker = DayTimeChecker();

  String name = SharePrefConfig.getUsername() ?? "";
  final homeController = HomePageController();

  String assessmentScore = (SharePrefConfig.getAssessmentScore() ?? "0");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _runPreferences = RunPreferences();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greet / Username
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Greeting
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _dayTimeChecker.dayTimeCheker(),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                            color: Colors.grey[800],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Colors.grey[200],
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const UserInfoPage(),
                              ),
                            ),
                            icon: Icon(
                              Icons.person,
                              color: Colors.grey[800],
                            ),
                          ),
                        )
                      ],
                    ),

                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1.0,
                        color: Colors.grey[600],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),

                _buildAssessmentPage(size, _runPreferences, assessmentScore),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  // color: Colors.orange,
                  child: Text(
                    'Minor Intervention',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),

                // Discover Page
                homePageCardWidget(
                  title: homeController.homepageController[1].title,
                  subtitle: homeController.homepageController[1].subtitle,
                  btnColor: kbtnColor,
                  logo: homeController.homepageController[1].img,
                  bgLogo: Colors.grey[300],
                  cardColor: homeController.homepageController[1].color,
                  context: context,
                  size: size,
                  route: homeController.homepageController[1].route,
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // Meditate Page
                homePageCardWidget(
                  title: homeController.homepageController[2].title,
                  subtitle: homeController.homepageController[2].subtitle,
                  btnColor: kbtnColor,
                  logo: homeController.homepageController[2].img,
                  bgLogo: Colors.grey[300],
                  cardColor: homeController.homepageController[2].color,
                  context: context,
                  size: size,
                  route: homeController.homepageController[2].route,
                ),
                const SizedBox(
                  height: 20.0,
                ),

                // Diary Page
                homePageCardWidget(
                  title: homeController.homepageController[3].title,
                  subtitle: homeController.homepageController[3].subtitle,
                  btnColor: kbtnColor,
                  logo: homeController.homepageController[3].img,
                  bgLogo: Colors.grey[300],
                  cardColor: homeController.homepageController[3].color,
                  context: context,
                  size: size,
                  route: homeController.homepageController[3].route,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  // color: Colors.orange,
                  child: Text(
                    'Major Intervention',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                // Professional Page
                homePageCardWidget(
                  title: homeController.homepageController[4].title,
                  subtitle: homeController.homepageController[4].subtitle,
                  btnColor: kbtnColor,
                  logo: homeController.homepageController[4].img,
                  bgLogo: Colors.grey[300],
                  cardColor: homeController.homepageController[4].color,
                  context: context,
                  size: size,
                  route: homeController.homepageController[4].route,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAssessmentPage(size, _runPreferences, assessmentScore) {
    return Container(
      decoration: BoxDecoration(
        color: homeController.homepageController[0].color,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  height: size.height * 0.19,
                  width: size.width * 0.24,
                  child: Align(
                    alignment: Alignment.center,
                    child: CircularPercentIndicator(
                      radius: 40,
                      percent: double.parse(assessmentScore) / 27.0,
                      center: Text(assessmentScore),
                      animation: true,
                      animationDuration: 1000,
                      
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      homeController.homepageController[0].title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      child: Text(
                        homeController.homepageController[0].subtitle,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white70,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kbtnColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AssessmentDisclaimerPage()));
                },
                child: const Text(
                  'Continue',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
