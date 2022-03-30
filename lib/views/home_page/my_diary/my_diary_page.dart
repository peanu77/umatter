import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:umatter/controllers/shared_pref_controller/shared_pref_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
import 'package:umatter/views/home_page/my_diary/page/select_emotion.dart';
import 'package:umatter/views/home_page/my_diary/page/view_diary_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

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

  selectEmoji() {
    if (SharePrefConfig.getEmoji.toString() == "Happy") {
      return const Text(
        '😀',
        style: TextStyle(fontSize: 30.0),
      );
    } else if (SharePrefConfig.getEmoji.toString() == "Sad") {
      return const Text(
        '😞',
        style: TextStyle(fontSize: 30.0),
      );
    }
  }

  final keyOne = GlobalKey();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback(
        (timeStamp) => ShowCaseWidget.of(context)?.startShowCase([
              keyOne,
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Diary',
          style: TextStyle(color: Colors.black, fontSize: 30.0),
        ),
        leading: IconButton(
          onPressed: () => Get.to(() => const NavBarPage()),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            //  Check if has data otherwise it will display a Exeption
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
                        "Can't Find Notes!",
                        style: TextStyle(
                            fontSize: 30.0, color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  /// We implement the use of set state simply to update the listview.builder once the user drag their finger to their screens.
                  setState(() {});
                },
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    /// We are fetching our data using the snapshot from our FutureBuilder to get the data from firebase firestore
                    Map? data = snapshot.data!.docs[index].data() as Map?;
                    DateTime dateTime = data!['created'].toDate();
                    String formattedDatetime =
                        DateFormat.yMMMd().add_jm().format(dateTime);
                    selectedEmoji(data);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      child: Card(
                        // color: Colors.orange,
                        // color: int.parse(SharePrefConfig.getSelectedColor()),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: InkWell(
                          /// Once the selected card is tap the this method will return the data, time and reference to the ViewDiaryPage
                          onTap: (() => Get.to(
                                () => ViewDiaryPage(
                                  data: data,
                                  time: formattedDatetime,
                                  ref: snapshot.data!.docs[index].reference,
                                  emotion:
                                      SharePrefConfig.getEmoji()?.toString(),
                                ),
                              )!
                                  .then(
                                (value) {
                                  setState(() {});
                                },
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      formattedDatetime,
                                      style: kTimeFnt,
                                    ),

                                    // TODO: Change this to a real emoji
                                    Container(
                                      child: selectedEmoji(data),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "${data['title']}",
                                  style: kPrimary,
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                SizedBox(
                                  height: 20.0,
                                  child: Text(
                                    "${data['description']}",
                                    style: kSecondary,
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

              /// We are using the .then to automatically refresh the page once the user created a diary.
              .then((value) {
            setState(() {});
          }),
        ),
      ),
    );
  }

  selectedEmoji(data) {
    if (data['emojis'] == "Happy") {
      return const Text(
        '😀',
        style: TextStyle(fontSize: 30.0),
      );
    } else if (data['emojis'] == "Sad") {
      return const Text(
        '😞',
        style: TextStyle(fontSize: 30.0),
      );
    }
  }
}
