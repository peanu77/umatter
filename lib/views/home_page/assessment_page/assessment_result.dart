import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

import '../../../controllers/shared_pref_controller/shared_pref_controller.dart';
import '../reach_out/directories_page.dart';

class AssessmentResult extends StatefulWidget {
  final String assessmentRes;
  const AssessmentResult({Key? key, required this.assessmentRes})
      : super(key: key);

  @override
  State<AssessmentResult> createState() => _AssessmentResultState();
}

class _AssessmentResultState extends State<AssessmentResult> {
  String assessmentScore = (SharePrefConfig.getAssessmentScore() ?? "0");
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Center(
                child: Text(
                  "Assessment Result".toUpperCase(),
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Based from your answer on the Assessment Test, You are manifesting  ',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                          letterSpacing: 1.0),
                    ),
                    TextSpan(
                      text: widget.assessmentRes,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[300],
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                        letterSpacing: 1.0,
                      ),
                    ),
                    TextSpan(
                      text:
                          " a symptoms of a seemingly mental health condition.",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CircularPercentIndicator(
                  radius: 60,
                  percent: double.parse(assessmentScore) / 27.0,
                  center: Text(assessmentScore),
                  animation: true,
                  animationDuration: 1000,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: _size.height * 0.08,
                width: double.infinity,
                child: ElevatedButton(
                  style: kElevatedbtnprimary,
                  onPressed: () {
                    if (widget.assessmentRes == "Moderateley Severe" ||
                        widget.assessmentRes == "Severe Depression") {
                      _buildDialog();
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const DiscoverPage()),
                          (route) => false);
                    }
                  },
                  child: const Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _buildDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Do you wish to look for a consultation with a list of licensed professionals right now or proceed with our recommendations?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const NavBarPage(),
                    ),
                    (route) => false),
                icon: const Icon(Icons.close),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProfessionalDirectoriesPage()),
                    (route) => false),
                icon: Icon(
                  Icons.check,
                  color: Colors.red.shade400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
