import 'package:flutter/material.dart';

import '../../../controllers/shared_pref_controller/shared_pref_controller.dart';

class AssessmentAnalytics extends StatefulWidget {
  const AssessmentAnalytics({Key? key}) : super(key: key);

  @override
  State<AssessmentAnalytics> createState() => _AssessmentAnalyticsState();
}

class _AssessmentAnalyticsState extends State<AssessmentAnalytics> {
  List<String> assessment = SharePrefConfig.getAssessment() ?? [];
  final controller = AssessmentDataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: assessment.length,
        itemBuilder: (context, index) => Text(
          assessment[index],
        ),
      ),
    );
  }
}

class AssessmentDataInfo {
  final String question;
  final String answer;

  AssessmentDataInfo(this.question, this.answer);
}

class AssessmentDataController {
  List<String> assessment = SharePrefConfig.getAssessment() ?? [];

  getAssessmentData() {
    assessment.map((e) => e);
  }

  final List<AssessmentDataInfo> assessmentData = [
    AssessmentDataInfo(
      "question",
      "assess",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
    AssessmentDataInfo(
      "question",
      "res",
    ),
  ];
}
