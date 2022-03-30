import 'package:flutter/material.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';

class AssessmentResult extends StatefulWidget {
  final String assessmentRes;
  const AssessmentResult({Key? key, required this.assessmentRes})
      : super(key: key);

  @override
  State<AssessmentResult> createState() => _AssessmentResultState();
}

class _AssessmentResultState extends State<AssessmentResult> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Text(
                  "Assessment Result",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                'Based from your answer on the Pre-Assessment Test, You are manifesting.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Text(
                  widget.assessmentRes,
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.red.shade400,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                ' Symptoms of a seemingly mental health condition.',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Spacer(
                flex: 2,
              ),
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
