import 'package:flutter/material.dart';
import 'package:umatter/views/assessment_page/assessment_page.dart';
import 'package:umatter/views/assessment_page/option_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class LabelPage extends StatefulWidget {
  const LabelPage({Key? key}) : super(key: key);

  @override
  State<LabelPage> createState() => _LabelPageState();
}

class _LabelPageState extends State<LabelPage> {
  final OptionControllerPage _optionControllerPage = OptionControllerPage();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Over the last 2 weeks, how often have you been bothered by any of the following problems?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Options',
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  'Scores',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              height: _size.height / 3,
              child: ListView.builder(
                itemCount: _optionControllerPage.optionInfoModel.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0),
                                    ),
                                    color: Colors.orange),
                                height: _size.height * 0.06,
                                child: Center(
                                  child: Text(_optionControllerPage
                                      .optionInfoModel[index].option),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: _size.height * 0.06,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                  ),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                      "${_optionControllerPage.optionInfoModel[index].score}"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: _size.height * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryFrmColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AssessmentPage())),
                  child: const Text(
                    'Got It!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
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
