import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/assessment_controller/assessment_controller.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/assessment_page/assessment_result.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

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
                      Center(
                        child: Text(
                          "Question ${index + 1} / ${controller.questionsController.length}",
                          // style: Theme.of(context).textTheme.headline4,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      Center(
                        child: Text(
                          controller.questionsController[index].question,
                          // textAlign: TextAlign.center,
                          // style: Theme.of(context).textTheme.headline5,
                          style: TextStyle(fontSize: 30.0),
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
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: kPrimaryFrmColor,
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "Not at all";
          int score = 0;
          scores.add(score);
          assessmentList.add(selectedItem);
          nextPageController();

          print(selectedItem);
        },
        child: Text(
          'Not at all',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  _buildSecondBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: kPrimaryFrmColor,
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "Several days";
          int score = 1;
          scores.add(score);
          assessmentList.add(selectedItem);

          nextPageController();

          print(selectedItem);
        },
        child: Text(
          'Several days',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  _buildThirdBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          primary: kPrimaryFrmColor,
          elevation: 2.0,
        ),
        onPressed: () {
          selectedItem = "More than half the days";
          int score = 2;
          scores.add(score);
          assessmentList.add(selectedItem);
          nextPageController();

          print(selectedItem);
        },
        child: Text(
          'More than half the days',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  _buildFourthBtn(_size) {
    return SizedBox(
      width: double.infinity,
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 2.0,
          primary: kPrimaryFrmColor,
        ),
        onPressed: () {
          selectedItem = "Nearly Everyday";
          int score = 3;
          scores.add(score);
          assessmentList.add(selectedItem);
          nextPageController();
          print(selectedItem);
        },
        child: Text(
          'Nearly Everyday',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  addForm() async {
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

  /// This function is responsible for the logic of getting the assessment of the user
  /// First we need to get the input of the user
  /// After getting the input from the user we loop the selected list of options from the user and then we evaluate them by their type of serverity.
  sumScores() {
    num sum = 0;
    for (var e in scores) {
      sum += e;
    }
    if (sum >= 0 && sum <= 5) {
      depressionLevel = "Mild";
      return depressionLevel;
    } else if (sum >= 6 && sum <= 10) {
      depressionLevel = "Moderate";
      return depressionLevel;
    } else if (sum >= 11 && sum <= 15) {
      depressionLevel = "Moderately Severe";
      return depressionLevel;
    } else if (sum >= 16) {
      depressionLevel = "Severe Depression";
      return depressionLevel;
    }
    // return sum;
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

      SharePrefConfig.setAssessment(assessmentList);
      addForm();
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
