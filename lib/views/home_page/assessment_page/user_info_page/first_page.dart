import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/assessment_page/user_info_page/user_info_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import '../../../../preferences/run_preferences.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _runPreferences = RunPreferences();
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Please provide the needed information on the next page',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: double.infinity,
                height: _size.height * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryFrmColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserInfoPage()),
                      (route) => false),
                  child: const Text('Okay!'),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
