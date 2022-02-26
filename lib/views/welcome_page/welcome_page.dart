import 'package:flutter/material.dart';
import 'package:umatter/views/assessment_page/assessment_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => NavBarPage(),
              ),
            ),
            icon: const Icon(Icons.skip_next),
          )
        ],
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Text('Hello There!'),
          const Spacer(
            flex: 2,
          ),
          Text('It\'s nice to meet you!'),
          const Spacer(
            flex: 2,
          ),
          Text('Before we proceed we !'),
          const Spacer(
            flex: 2,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AssessmentPage(),
                      ),
                    ),
                    child: Text('Okay!'),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
