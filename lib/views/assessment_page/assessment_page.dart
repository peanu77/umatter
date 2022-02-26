import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/assessment_controller/assessment_controller.dart';
import 'package:umatter/views/assessment_page/assessment_result.dart';
import 'package:umatter/views/assessment_page/const.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  PageController pageController = PageController();
  bool isSelected = false;
  var selectedItem = '';
  final controller = AssessmentController();
  String depressionLevel = '';
  List selected = [];
  List<int> scores = [];

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

  var selectedPageIndex = 0.obs;
  bool get isLastPage =>
      selectedPageIndex.value == controller.questionsController.length - 1;
  nextPageController() {
    if (isLastPage == true) {
      Get.to(() => AssessmentResult(
            assessmentRes: sumScores(),
          ));
      addForm();
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        "Question ${index + 1} / ${controller.questionsController.length}",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      // Text(
                      //   'Over the last 2 weeks, how often have you been..',
                      //   textAlign: TextAlign.center,
                      //   style: Theme.of(context).textTheme.headline4,
                      // ),
                      const SizedBox(height: 25.0),
                      Text(
                        controller.questionsController[index].question,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildFirstBtn(),
                        const SizedBox(height: 15.0),
                        _buildSecondBtn(),
                        const SizedBox(height: 15.0),
                        _buildThirdBtn(_size),
                        const SizedBox(height: 15.0),
                        _buildFourthBtn(),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      for (var i = 0; i < selected.length; i++) {
                        print(selected[i]);
                      }
                      print(sumScores());
                      addForm();
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         AfterAssessment(res: sumScores()),
                      //   ),
                      // );
                    },
                    child: Text('Get Result'),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _buildFirstBtn() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: kprimayColor,
          backgroundColor: isSelected ? kSelectedColor : kNotSelected,
          elevation: kbtnElevation,
        ),
        onPressed: () {
          selectedItem = "Not at all";
          int score = 0;
          scores.add(score);
          selected.add(selectedItem);
          nextPageController();
          setState(() {
            if (isSelected) {
              isSelected = true;
            }
          });
          print(selectedItem);
        },
        child: Text(
          'Not at all',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  _buildSecondBtn() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: kprimayColor,
          backgroundColor: isSelected ? kSelectedColor : kNotSelected,
          elevation: kbtnElevation,
        ),
        onPressed: () {
          selectedItem = "Several days";
          int score = 1;
          scores.add(score);
          selected.add(selectedItem);

          nextPageController();
          setState(() {
            if (isSelected) {
              isSelected = true;
            }
          });
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
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: kprimayColor,
          backgroundColor: isSelected ? kSelectedColor : kNotSelected,
          elevation: kbtnElevation,
        ),
        onPressed: () {
          selectedItem = "More than half the days";
          int score = 2;
          scores.add(score);
          selected.add(selectedItem);
          nextPageController();
          setState(() {
            if (isSelected) {
              isSelected = true;
            }
          });
          print(selectedItem);
        },
        child: Text(
          'More than half the day',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  _buildFourthBtn() {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: kprimayColor,
          backgroundColor: isSelected ? kSelectedColor : kNotSelected,
          elevation: kbtnElevation,
        ),
        onPressed: () {
          selectedItem = "Nearly Everyday";
          int score = 3;
          scores.add(score);
          selected.add(selectedItem);
          nextPageController();
          setState(() {
            isSelected = true;
          });
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
      "user_selection": selected,
      "depression_severity": sumScores().toString(),
    };
    ref.add(data);
  }
}
