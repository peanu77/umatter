import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/quotes.json'),
        builder: ((context, snapshot) {
          var jsonData = json.decode(
            snapshot.data.toString(),
          );

          /// This Method used to randomize the return data to the PageView.builder()
          randomData(jsonData);
          return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jsonData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Align(
                        widthFactor: 15.0,
                        alignment: Alignment.topLeft,
                        child: FaIcon(FontAwesomeIcons.quoteLeft),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        // Quotes
                        child: Text(
                          jsonData[randomData(jsonData)]['text'],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      const Align(
                        widthFactor: 15.0,
                        alignment: Alignment.bottomRight,
                        child: FaIcon(FontAwesomeIcons.quoteRight),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Text(
                        // Author
                        "- " + jsonData[randomData(jsonData)]['author'],
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {});
        },
        child: const Icon(Icons.refresh),
        backgroundColor: kPrimaryFrmColor,
      ),
    );
  }

  randomData(jsonData) {
    var rand = Random();

    int randomNum = 0;

    for (var i = 0; i < jsonData.length; i++) {
      randomNum = rand.nextInt(jsonData.length);
    }
    // print(randomNum);
    return randomNum;
  }
}
