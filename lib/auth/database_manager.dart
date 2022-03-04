import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DatabaseManager {
  /// This function is for saving the user input into the firebase firestore database
  /// by the use of Collection reference we we are getting the instance of firebase firestore /// and use the collection to create a user and assign it with a document type UID

  /// In this function we are calling the FirebaseAuth instance
  /// an CollectionReference of FirebaseFirestore
  /// and it is creating a collections of users that is based on the user UID or Unique User ID and once it created it will create another collection of user_info to store the user username.
  createUserInfo(username, age, gender, civilStatus) {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .collection('user_info');

    var userData = {
      'username': username,
      'age': age,
      'gender': gender,
      "civil_status": civilStatus,
    };
    // Adding data to the collection in firebase
    ref.add(userData);
  }

  Future addForm(String title, String desc, formKey, String emotions) async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .collection('notes');

    // Create user data
    var data = {
      'title': title,
      'description': desc,
      'created': DateTime.now(),
      'emojis': emotions.toString(),
      // 'selectedColor': setBackgroundColor(_bgColor).toString(),
    };

    // Validate Form
    if (formKey.currentState!.validate()) {
      ref.add(data);
    }
    Get.back();
  }
}
