import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:umatter/auth/auth.dart';
import 'package:umatter/views/user_info_page/user_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const UserInfoPage();
            } else {
              return const LoginWidget();
            }
          }),
    );
  }
}
