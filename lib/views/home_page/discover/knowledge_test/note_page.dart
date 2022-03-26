import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/knowledge_page.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            'Before We proceed asdksadsd',
            style: Theme.of(context).textTheme.headline4,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: kPrimaryFrmColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const KnowledgeCheckPage(),
              )),
              child: const Text("Continue"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
