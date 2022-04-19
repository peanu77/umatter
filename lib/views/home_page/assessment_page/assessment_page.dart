import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/assessment_controller/assessment_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/assessment_page/assessment_result.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  PageController pageController = PageController();
  final controller = AssessmentController();

  List<int> scores = [];
  List<String> assessmentList = [];
  List<String> assessmentScores = [];
  var selectedItem = '';
  String depressionLevel = '';
  var selectedPageIndex = 0.obs;

  /// This will check if the user reached the last page
  bool get isLastPage =>
      selectedPageIndex.value == controller.questionsController.length - 1;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: selectedPageIndex,
          controller: pageController,
          itemCount: controller.questionsController.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Question ${index + 1} / ${controller.questionsController.length}",
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        controller.questionsController[index].question,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[800],
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Column(
                    children: [
                      _buildFirstBtn(_size),
                      const SizedBox(height: 15.0),
                      _buildSecondBtn(_size),
                      const SizedBox(height: 15.0),
                      _buildThirdBtn(_size),
                      const SizedBox(height: 15.0),
                      _buildFourthBtn(_size),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _buildFirstBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: Colors.grey[300],
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "Not at all";
          int score = 0;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());
          nextPageController();
          print(score);
          print(selectedItem);
          // print(selectedItem);
        },
        child: const Text(
          'Not at all',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildSecondBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: Colors.grey[300],
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "Several days";
          int score = 1;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());

          nextPageController();
          print(score);
          // print(selectedItem);
        },
        child: const Text(
          'Several days',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildThirdBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: Colors.grey[300],
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "More than half the days";
          int score = 2;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());
          nextPageController();

          print(score);
          // print(selectedItem);
        },
        child: const Text(
          'More than half the days',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  _buildFourthBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.08,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 2.0,
          primary: Colors.grey[300],
        ),
        onPressed: () {
          selectedItem = "Nearly Everyday";
          int score = 3;
          scores.add(score);
          assessmentList.add(selectedItem);
          assessmentScores.add(score.toString());
          nextPageController();

          print(score);
          // print(selectedItem);
        },
        child: const Text(
          'Nearly Everyday',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  addAssessmentForm() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('assessment');

    var data = {
      "question": controller.questionsController.length,
      "user_selection": assessmentList,
      "depression_severity": sumScores().toString(),
    };
    ref.add(data);
  }

  sumScores() {
    num score = 0;
    for (var e in scores) {
      score += e;
      SharePrefConfig.setAssessmentScore(score.toString());
    }
    if (score >= 0 && score <= 5) {
      depressionLevel = "Mild";
      return depressionLevel;
    } else if (score >= 6 && score <= 10) {
      depressionLevel = "Moderate";
      return depressionLevel;
    } else if (score >= 11 && score <= 15) {
      depressionLevel = "Moderately Severe";
      return depressionLevel;
    } else if (score >= 16) {
      depressionLevel = "Severe Depression";
      return depressionLevel;
    }
    // SharePrefConfig.setAssessmentScore(score.toString());
    return score;
  }

  nextPageController() {
    if (isLastPage == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AssessmentResult(
            assessmentRes: sumScores(),
          ),
        ),
      );
      print(sumScores());
      SharePrefConfig.setAssessment(assessmentList);
      SharePrefConfig.setAssessment(assessmentScores);
      addAssessmentForm();
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
