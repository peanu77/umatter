import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/add_diary.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class EmojiSelectorPage extends StatelessWidget {
  EmojiSelectorPage({Key? key}) : super(key: key);
  String selectedReason = '';
  String emotions = 'Happy';

  List<String> reasonList = SharePrefConfig.getReasons() ?? [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'I am Feeling...',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Spacer(),
            SizedBox(
              height: 260,
              // color: Colors.orange,
              child: PageView(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  if (index == 0) {
                    emotions = "Happy";
                  } else if (index == 1) {
                    emotions = "Sad";
                  }
                  print(emotions);
                },
                children: [
                  Lottie.asset('assets/icons/json/happy.json'),
                  Lottie.asset('assets/icons/json/sad.json'),
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(15.0),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  primary: kPrimaryFrmColor,
                ),
                // TODO: Get to the Add Page Diary.
                onPressed: () {
                  SharePrefConfig.setEmoji(emotions);
                  print(reasonList);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => AddDiaryPage(
                        reason: reasonList.toString(),
                      ),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
