import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/assessment_page/welcome_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                'Before you proceed, let us assess your condition first',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(25.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  primary: kPrimaryFrmColor,
                ),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      titlePadding: const EdgeInsets.all(15.0),
                      title: const Center(
                        child: Text(
                          'Disclaimer',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      content: const Text(
                        'The following Assessment is from the Primary Care Evaluation of Mental Disorders Patient Health Questionnaire (PRIME-MD PHQ). The PHQ was developed by Drs. Robert L. Spitzer, Janet B.W. Williams, Kurt Kroenke and colleagues. For research information, contact Dr. Spitzer at rls8@columbia.edu. PRIME-MD® is a trademark of Pfizer Inc. Copyright© 1999 Pfizer Inc. All rights reserved. Reproduced with permission',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                      ),
                      actions: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SizedBox(
                            height: _size.height * 0.08,
                            width: double.infinity,
                            child: ElevatedButton(
                              // Navigate to Assessment Page
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LabelPage(),
                                ),
                              ),

                              child: const Text('Continue'),
                              style: ElevatedButton.styleFrom(
                                primary: kPrimaryFrmColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Take me to Assessment',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const NavBarPage(),
                    ),
                    (route) => false),
                child: const Text(
                  'Not Now',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Text(
                "This Application is not intended to replace any clinical diagnosis or treatment.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
