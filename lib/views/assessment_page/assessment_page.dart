import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:umatter/controllers/assessment_controller/assessment_controller.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({Key? key}) : super(key: key);

  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  var selectedItem = '';
  final controller = AssessmentController();
  String depression_level = '';
  List selected = [];
  List<int> scores = [];

  /// This function is responsible for the logic of getting the assessment of the user
  /// First we need to get the input of the user
  /// After getting the input from the user we loop the selected list of options from the user and then we evaluate them by their type of serverity.
  sumScores() {
    num sum = 0;
    scores.forEach((num e) {
      sum += e;
    });
    if (sum >= 0 && sum <= 5) {
      depression_level = "Mild";
      return depression_level;
    } else if (sum >= 6 && sum <= 10) {
      depression_level = "Moderate";
      return depression_level;
    } else if (sum >= 11 && sum <= 15) {
      depression_level = "Moderately Severe";
      return depression_level;
    } else if (sum >= 16) {
      depression_level = "Severe Depression";
      return depression_level;
    }
    // return sum;
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
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
                        'Over the last 2 weeks, how often have you been..',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(height: 20.0),
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
                        InkWell(
                          onTap: () {
                            selectedItem = "Not at all";
                            int score = 0;
                            scores.add(score);
                            selected.add(selectedItem);

                            print(selectedItem);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange,
                            ),
                            width: double.infinity,
                            height: _size.height * 0.1,
                            child: const Center(
                              child: Text('Not at all'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            selectedItem = "Several days";
                            selected.add(selectedItem);
                            int score = 1;
                            scores.add(score);
                            print(selectedItem);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange,
                            ),
                            width: double.infinity,
                            height: _size.height * 0.1,
                            child: const Center(
                              child: Text('Several days'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            selectedItem = "More than half the days";
                            selected.add(selectedItem);
                            int score = 2;
                            scores.add(score);
                            print(selectedItem);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange,
                            ),
                            width: double.infinity,
                            height: _size.height * 0.1,
                            child: const Center(
                              child: Text('More than half the days'),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        InkWell(
                          onTap: () {
                            selectedItem = "Nearly everyday";
                            selected.add(selectedItem);
                            int score = 3;
                            scores.add(score);
                            print(selectedItem);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange,
                            ),
                            width: double.infinity,
                            height: _size.height * 0.1,
                            child: const Center(
                              child: Text('Nearly everyday'),
                            ),
                          ),
                        ),
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
                      // addForm();
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

  addForm() async {
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('assessment');

    var data = {
      "question": controller.questionsController.length,
      "selected": selected,
      "total_scores": sumScores().toString(),
      "depression_severity": depression_level,
    };
    ref.add(data);
    print('Done');
  }
}
