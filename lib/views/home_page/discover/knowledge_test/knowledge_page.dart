import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/knowledge_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class KnowledgeCheckPage extends StatefulWidget {
  const KnowledgeCheckPage({Key? key}) : super(key: key);

  @override
  State<KnowledgeCheckPage> createState() => _KnowledgeCheckPageState();
}

class _KnowledgeCheckPageState extends State<KnowledgeCheckPage> {
  final _knowledge = KnowledgeController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.height * 0.08;
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          body: PageView(
            children: [
              _buildFirstPage(_size),
            ],
          ),
        ),
      ),
    );
  }

  _buildFirstPage(_size) => Column(
        children: [
          const Spacer(),
          Text(
            "Question ${1} / ${_knowledge.knowledgeController.length}",
            style: Theme.of(context).textTheme.headline4,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              _knowledge.knowledgeController[0].question,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          // Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: _size,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryFrmColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {},
                child: const Text('True'),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              height: _size,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryFrmColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                onPressed: () {},
                child: const Text('True'),
              ),
            ),
          ),
          const Spacer(),
        ],
      );
}
