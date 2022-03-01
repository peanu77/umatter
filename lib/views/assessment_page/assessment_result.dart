import 'package:flutter/material.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';

class AssessmentResult extends StatefulWidget {
  String assessmentRes;
  AssessmentResult({Key? key, required this.assessmentRes}) : super(key: key);

  @override
  State<AssessmentResult> createState() => _AssessmentResultState();
}

class _AssessmentResultState extends State<AssessmentResult> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Heads Up User!",
              style: Theme.of(context).textTheme.headline3,
            ),
            const Spacer(),
            Text(
              'Based from your answer on the Pre-Assessment Test, You are manifesting',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              widget.assessmentRes,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                ' Symptoms of a seemingly mental health condition.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: _size.height * 0.08,
                width: double.infinity,
                child: ElevatedButton(
                  style: kElevatedbtnprimary,
                  onPressed: () {
                    if (widget.assessmentRes == "Moderateley Severe" ||
                        widget.assessmentRes == "Severe Depression") {
                      _buildDialog();
                    } else {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const NavBarPage(),
                        ),
                      );
                    }
                  },
                  child: const Text('What now?'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildDialog() {
    return showDialog(
      barrierColor: Colors.white,
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: const Text(
          'Do you wish to look for a consultation with a list of licensed professionals right now or proceed with our recommendations?',
          textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const ProfessionalDirectoriesPage(),
                    ),
                  ),
                  child: const Text('Proceed'),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => NavBarPage(),
                    ),
                  ),
                  child: const Text('Not Now'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
