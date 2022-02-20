import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/nav_bar/navbar_page.dart';
import 'package:umatter/views/welcome_page/welcome_page.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  String username = '';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            // Grettings
            Container(
              child: Text(
                'So nice to meet you! What do your friends call you?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            // Form
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text('UserName'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onChanged: (value) => username = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid username";
                    }
                    if (value.length > 10) {
                      return "Username too long!";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            // Button
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                height: _size.height * 0.06,
                child: ElevatedButton(
                  style: kElevatedbtnprimary,
                  onPressed: () => addUserName(),
                  child: const Text('Looks Good !'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// In this function we are calling the FirebaseAuth instance
  /// an CollectionReference of FirebaseFirestore
  /// and it is creating a collections of users that is based on the user UID or Unique User ID and once it created it will create another collection of user_info to store the user username.
  addUserName() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection('user_info');

    var data = {
      'username': username,
    };

    /// This condition is checking if the form is valid it will save to the FirebaseFirestore  and once it's valid it will send the user to the Assessment Page
    if (_formKey.currentState!.validate()) {
      ref.add(data);
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
    );
  }
}
