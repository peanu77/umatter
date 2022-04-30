import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/auth/auth_pages/login_page_controller.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DatabaseManager {
  signIn(
    emailController,
    passwordController,
    context,
    sharePrefConfig,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      sharePrefConfig.onboardingPageInfoController();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Invalid email',
              ),
            ),
          );
          break;

        case "user-not-found":
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User not found'),
            ),
          );
          break;

        case "wrong-password":
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid password'),
            ),
          );
          break;

        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please check your credentials and try again'),
            ),
          );
      }
    }
  }

  googleLogin() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();

    return Get.to(() => const LogInPage());
  }

  Future deleteUser(context) async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Invalid email',
            ),
          ),
        );
        print(
            'The user must reauthenticate before this operation can be executed');
      }
    }
  }

  // Diary Page
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
    ref.add(userData);
  }
}
