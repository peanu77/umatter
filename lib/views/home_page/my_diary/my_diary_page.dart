import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/analytics/my_diary_analytics.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/my_diary/page/select_emotion.dart';
import 'package:umatter/views/home_page/my_diary/page/view_diary_page.dart';

class MyDiaryPage extends StatefulWidget {
  const MyDiaryPage({Key? key}) : super(key: key);

  @override
  _MyDiaryPageState createState() => _MyDiaryPageState();
}

class _MyDiaryPageState extends State<MyDiaryPage> {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('notes');

  final myEmotions = ["😀 Happy", "😞 Sad", "Lonely"];

  selectEmoji() {
    if (SharePrefConfig.getEmoji.toString() == "Happy") {
      return Text(
        myEmotions[0],
        style: ktextStyle,
      );
    }
    if (SharePrefConfig.getEmoji.toString() == "Sad") {
      return Text(
        myEmotions[1],
        style: ktextStyle,
      );
    }
  }

  final ktextStyle = const TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    letterSpacing: 1.0,
  );

  final keyOne = GlobalKey();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
        (timeStamp) => ShowCaseWidget.of(context)?.startShowCase([
              keyOne,
            ]));
  }

  final textStyle = const TextStyle(fontSize: 25.0);

  final emotions = [
    "😀",
    "😞",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Diary',
          style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.chevron_left,
            color: Colors.grey[700],
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/img/diary/no_notes.svg',
                        height: 200.0,
                        width: 200.0,
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Empty Diary",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  // This will automatically refresh the page once the use saved the diary.
                  setState(() {});
                },
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    Map? data = snapshot.data!.docs[index].data() as Map?;
                    DateTime dateTime = data!['created'].toDate();
                    String formattedDatetime =
                        DateFormat.yMMMd().add_jm().format(dateTime);
                    selectedEmoji(data);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () => Navigator.of(context)
                              .push(MaterialPageRoute(
                                builder: (context) => ViewDiaryPage(
                                  data: data,
                                  time: formattedDatetime,
                                  ref: snapshot.data!.docs[index].reference,
                                  emotion:
                                      SharePrefConfig.getEmoji()?.toString(),
                                ),
                              ))
                              .then((value) => setState(() {})),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Create at (time)
                                    Text(
                                      formattedDatetime.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[400],
                                        letterSpacing: 0.7,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),

                                    // Emoji
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: Colors.grey[200],
                                      ),
                                      child: selectedEmoji(data),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${data['title']}",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),

                                // Note description
                                SizedBox(
                                  height: 20.0,
                                  child: Text(
                                    "${data['description']}",
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: Showcase(
        key: keyOne,
        description: "Create Diary",
        child: FloatingActionButton(
          backgroundColor: kPrimaryFrmColor,
          tooltip: "Create Diary",
          child: const FaIcon(
            FontAwesomeIcons.featherAlt,
            // color: Colors.black,
          ),
          onPressed: () => Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const EmojiSelectorPage(),
            ),
          )
              .then((value) {
            setState(() {});
          }),
        ),
      ),
    );
  }

  selectedEmoji(data) {
    if (data['emojis'] == "Happy") {
      return Text(emotions[0], style: textStyle);
    } else if (data['emojis'] == "Sad") {
      return Text(emotions[1], style: textStyle);
    }
  }
}
