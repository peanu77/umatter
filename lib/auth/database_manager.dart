import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:umatter/views/welcome_page/welcome_page.dart';

class DatabaseManager {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  /// This function is for saving the user input into the firebase firestore database
  /// by the use of Collection reference we we are getting the instance of firebase firestore /// and use the collection to create a user and assign it with a document type UID
  Future addForm(String title, String desc, formKey) async {
    ref.doc(firebaseAuth.currentUser?.uid).collection('notes');

    // Create user data
    var data = {
      'title': title,
      'description': desc,
      'created': DateTime.now(),
      // 'emojis': {}
      // 'selectedColor': setBackgroundColor(_bgColor).toString(),
    };

    // Validate Form
    if (formKey.currentState!.validate()) {
      ref.add(data);
    }
    Get.back();
  }

  /// In this function we are calling the FirebaseAuth instance
  /// an CollectionReference of FirebaseFirestore
  /// and it is creating a collections of users that is based on the user UID or Unique User ID and once it created it will create another collection of user_info to store the user username.
  createUserInfo(
      String username, String age, String gender, String civilStatus) {
    ref.doc(firebaseAuth.currentUser?.uid).collection('user_info');

    var userData = {
      'username': username,
      'age': age,
      'gender': gender,
      "civil_status": civilStatus,
    };
    // Adding data to the collection in firebase
    ref.add(userData);
    Get.to(() => const WelcomePage());
  }

  // final List<UserData> _userData = [];
  // List<UserData> getData() {
  //   return _userData;
  // }

  // Future<void> getUserData() async {
  //   DocumentSnapshot snapshot = await ref.doc().get();
  //   var data = snapshot.data() as Map;
  //   var userInfo = data['user_info'];
  //   userInfo.forEach(
  //     (data) => {
  //       _userData.add(UserData.fromJson(data)),
  //     },
  //   );
  // }
}

// class UserData {
//   String username;
//   String age;
//   String gender;
//   String civilStatus;
//   UserData({
//     required this.username,
//     required this.age,
//     required this.gender,
//     required this.civilStatus,
//   });
//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//         username: json['username'],
//         age: json['age'],
//         gender: json['gender'],
//         civilStatus: json['civilStatus']);
//   }
// }
