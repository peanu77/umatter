import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/game_page.dart';

import 'trueorfalse_controller.dart';

class KnowledgeResultPage extends StatefulWidget {
  final double score;
  const KnowledgeResultPage({Key? key, required this.score}) : super(key: key);

  @override
  State<KnowledgeResultPage> createState() => _KnowledgeResultPageState();
}

class _KnowledgeResultPageState extends State<KnowledgeResultPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
            vertical: 30.0,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const DiscoverPage(),
                      ),
                      (route) => false),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey[200],
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Congratulations you got ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          "${widget.score.round()} / ${knowledgeController.length}",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: CircularPercentIndicator(
                  radius: 60,
                  percent: widget.score / knowledgeController.length,
                  center: Text("${widget.score.round()}"),
                  animation: true,
                  animationDuration: 1000,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              SizedBox(
                width: double.infinity,
                height: _size.height * 0.08,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ),
                      (route) => false),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    primary: kbtnColor,
                  ),
                  child: const Text('Continue'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
