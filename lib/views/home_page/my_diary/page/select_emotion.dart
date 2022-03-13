import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/views/home_page/my_diary/page/add_diary.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

import '../../../../controllers/shared_pref_controller/shared_pref_controller.dart';

class EmojiSelectorPage extends StatefulWidget {
  const EmojiSelectorPage({Key? key}) : super(key: key);

  @override
  State<EmojiSelectorPage> createState() => _EmojiSelectorPageState();
}

class _EmojiSelectorPageState extends State<EmojiSelectorPage> {
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
                  Lottie.asset('assets/img/diary/happy.json'),
                  Lottie.asset('assets/img/diary/sad.json'),
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
                onPressed: () {
                  SharePrefConfig.setEmoji(emotions);
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const AddDiaryPage(),
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
