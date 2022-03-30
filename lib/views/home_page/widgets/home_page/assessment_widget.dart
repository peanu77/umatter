import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:umatter/constants/const.dart';

import '../../../../controllers/home_page_controller/home_page_controller.dart';
import '../../../../preferences/consts.dart';
import '../../../../preferences/run_preferences.dart';
import '../../../welcome_page/welcome_page.dart';
import '../../assessment_page/user_info_page/first_page.dart';

class AssessmentWidget extends StatefulWidget {
  final size;
  const AssessmentWidget({Key? key, this.size}) : super(key: key);

  @override
  State<AssessmentWidget> createState() => _AssessmentWidgetState();
}

class _AssessmentWidgetState extends State<AssessmentWidget> {
  final keyOne = GlobalKey();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
        (timeStamp) => ShowCaseWidget.of(context)?.startShowCase([keyOne]));
  }

  @override
  Widget build(BuildContext context) {
    final _runPreferences = RunPreferences();
    return Column(
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
                            width: widget.size.width * 0.5,
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
                      SizedBox(
                        height: widget.size.height * 0.19,
                        width: widget.size.width * 0.3,
                        child: SvgPicture.asset(kAssessmentCover),
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
                      bool firstAssessment =
                          await _runPreferences.getFirstRun(assessmentRunKey);
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
    );
  }
}
