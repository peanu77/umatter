import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:umatter/constants/daytime_checker.dart';
import 'package:umatter/controllers/home_page_controller/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/widgets/home_page/assessment_widget.dart';
import 'package:umatter/views/home_page/widgets/home_page/discover_widget.dart';
import 'package:umatter/views/home_page/widgets/home_page/journal_widget.dart';
import 'package:umatter/views/home_page/widgets/home_page/major_intervention_widget.dart';
import 'package:umatter/views/home_page/widgets/home_page/meditate_widget.dart';
import 'package:umatter/preferences/run_preferences.dart';

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

  @override
  Widget build(BuildContext context) {
    // final _runPreferences = RunPreferences();
    final _dayTimeChecker = DayTimeChecker();
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
                        _dayTimeChecker.dayTimeCheker(),
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
                AssessmentWidget(size: size),
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
                // Discover
                DiscoverWidget(size: size),
                // Meditate
                MeditateWidget(size: size),
                // My Diary
                JournalWidget(size: size),
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
                // Major Intervention Page
                MajorInterventionWidget(size: size),
              ],
            );
          }),
        ),
      ),
    );
  }
}
