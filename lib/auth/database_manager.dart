import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class DatabaseManager {
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
    };

    // Validate Form
    if (formKey.currentState!.validate()) {
      ref.add(data);
    }
    Get.back();
  }

  Future deleteUser() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        // TODO: Remove this shit in production
        print(
            'The user must reauthenticate before this operation can be executed');
      }
    }
  }
}
