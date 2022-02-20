import 'package:flutter/material.dart';

class AssessmentResults extends StatefulWidget {
  const AssessmentResults({Key? key}) : super(key: key);

  @override
  _AssessmentResultsState createState() => _AssessmentResultsState();
}

class _AssessmentResultsState extends State<AssessmentResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('The result from the asessment you take is '),
      ),
    );
  }
}
