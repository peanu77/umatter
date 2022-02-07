import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/auth/auth_controller.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/models/contants/settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
                SizedBox(
                  height: _size.height * 0.10,
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
                                style: TextStyle(fontSize: 20.0),
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
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: _size.height * 0.10,
                  child: ElevatedButton(
                    style: sDarkModeBtn,
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
                                Icons.dark_mode_outlined,
                                size: 20.0,
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Text(
                                'Dark Mode',
                                style: TextStyle(fontSize: 20.0),
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
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: _size.height * 0.10,
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
                                style: TextStyle(fontSize: 20.0),
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
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: _size.height * 0.10,
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
                                style: TextStyle(fontSize: 20.0),
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
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: _size.height * 0.10,
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
                                style: TextStyle(fontSize: 20.0),
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
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  height: _size.height * 0.10,
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
                                style: TextStyle(fontSize: 20.0),
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
                ),
                const SizedBox(
                  height: 15.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: _size.height * 0.10,
                        child: ElevatedButton(
                          style: sLogoutBtn,
                          onPressed: () {},
                          // onPressed: () => AuthController.instance.logout(),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                      style: TextStyle(fontSize: 20.0),
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
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
