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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('json/quotes.json'),
        builder: ((context, snapshot) {
          var jsonData = json.decode(snapshot.data.toString());

          /// This Method used to randomize the return data to the PageView.builder()
          randomData(jsonData);
          return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: jsonData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Align(
                      widthFactor: 15.0,
                      alignment: Alignment.topLeft,
                      child: FaIcon(FontAwesomeIcons.quoteLeft),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                      "-" + jsonData[index]['author'],
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kPrimaryFrmColor,
        onPressed: () async {
          setState(() {});
        },
        tooltip: "Display new quotes",
        label: Row(children: const [
          Text(
            'Get New Quotes',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 10.0,
          ),
          Icon(
            Icons.refresh,
            color: Colors.black,
          ),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  randomData(jsonData) {
    var rand = Random();

    int randomNum = 0;

    for (var i = 0; i < jsonData.length; i++) {
      randomNum = rand.nextInt(jsonData.length);
    }
    return randomNum;
  }
}
