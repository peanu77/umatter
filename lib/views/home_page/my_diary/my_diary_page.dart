import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:umatter/views/home_page/my_diary/page/add_diary.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Diary',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            /// This will check if the user associated with the account used for login has a data if not it will display the Lottie.asset() otherwise it will display the the data available.
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Lottie.asset('assets/icons/json/diary.json',
                      width: 300.0),
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

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 2.0,
                      ),
                      child: Card(
                        color: Colors.orangeAccent,
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
                                ),
                              )!
                                  .then(
                                (value) {
                                  setState(() {});
                                },
                              )),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  formattedDatetime,
                                  style: kTimeFnt,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryFrmColor,
        tooltip: "Create Diary",
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => const AddDiaryPage(),
          ),
        )

            /// We are using the .then to automatically refresh the page once the user created a diary.
            .then((value) {
          setState(() {});
        }),
      ),
    );
  }
}
