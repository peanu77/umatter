import 'package:flutter/material.dart';
import 'package:umatter/auth/auth.dart';
import 'package:umatter/models/contants/settings.dart';
import 'package:umatter/views/settings_page/constant/settings_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final kBoxHeight = _size.height * 0.09;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 20.0,
              ),
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  _buildNotification(kBoxHeight),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _buildReportaProblem(kBoxHeight),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _buildTermsandCondition(kBoxHeight),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _buildPrivacyandPolicy(kBoxHeight),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _buildDeleteAccount(kBoxHeight),
                  const SizedBox(
                    height: 15.0,
                  ),
                  _buildLogOut(kBoxHeight),
                  const SizedBox(
                    height: 40.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildNotification(kBoxHeight) {
    return SizedBox(
      height: kBoxHeight,
      child: ElevatedButton(
        style: sNotifBtn,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.notifications_none,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Notification',
                    style: kSettingsFnt,
                  ),
                ],
              ),
              IconButton(
                // TODO: Navigate to Notification Page
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildReportaProblem(kBoxHeight) {
    return SizedBox(
      height: kBoxHeight,
      child: ElevatedButton(
        style: sReportBtn,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.report_gmailerrorred_outlined,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Report a Problem',
                    style: kSettingsFnt,
                  ),
                ],
              ),
              IconButton(
                // TODO: Navigate to Notification Page
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTermsandCondition(kBoxHeight) {
    return SizedBox(
      height: kBoxHeight,
      child: ElevatedButton(
        style: sTermsBtn,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.description_outlined,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Terms and Conditions',
                    style: kSettingsFnt,
                  ),
                ],
              ),
              IconButton(
                // TODO: Navigate to Notification Page
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildPrivacyandPolicy(kBoxHeight) {
    return SizedBox(
      height: kBoxHeight,
      child: ElevatedButton(
        style: sPrivacyBtn,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.privacy_tip_outlined,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Privacy and Policy',
                    style: kSettingsFnt,
                  ),
                ],
              ),
              IconButton(
                // TODO: Navigate to Notification Page
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildDeleteAccount(kBoxHeight) {
    return SizedBox(
      height: kBoxHeight,
      child: ElevatedButton(
        style: sDeleteBtn,
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.delete_outline,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Delete Account',
                    style: kSettingsFnt,
                  ),
                ],
              ),
              IconButton(
                // TODO: Navigate to Notification Page
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.signOut();
    return Get.to(() => LogInPage());
  }

  Widget _buildLogOut(kBoxHeight) {
    return SizedBox(
      height: kBoxHeight,
      child: ElevatedButton(
        style: sLogoutBtn,
        onPressed: signOut,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.logout_outlined,
                    size: 20.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    'Logout',
                    style: kSettingsFnt,
                  ),
                ],
              ),
              IconButton(
                // TODO: Navigate to Notification Page
                onPressed: () {},
                icon: const Icon(
                  Icons.chevron_right,
                  size: 30.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
