import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/views/home_page/settings_page/settings_card_widget.dart';
import 'package:umatter/views/home_page/settings_page/settings_controller.dart';
import 'package:umatter/views/home_page/settings_page/settings_label_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/shared_pref_controller/shared_pref_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = SharePrefConfig.getUsername() ?? "";
    String age = SharePrefConfig.getAge() ?? "";
    String gender = SharePrefConfig.getGender() ?? "";
    String civilstatus = SharePrefConfig.getCivilStatus() ?? "";

    final size = MediaQuery.of(context).size;
    final kBoxHeight = size.height * 0.09;
    final controller = SettingsControllerPage();
    final databaseController = DatabaseManager();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
              child: Text(
                'Settings',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    letterSpacing: 1.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                settingsLabelWidget(
                  title: 'Personal Information',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
                userInfoWidget(size, name, age, gender, civilstatus),
                settingsLabelWidget(
                  title: 'Permissions',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.grey[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                  onPressed: () {},
                  child: settingsCardWidget(
                    title: controller.settingsController[0].title,
                    icon: Icons.notifications_none_outlined,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                settingsLabelWidget(
                  title: 'Application Standards',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      primary: Colors.grey[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                  child: settingsCardWidget(
                    title: controller.settingsController[1].title,
                    icon: Icons.description_outlined,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      primary: Colors.grey[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                  child: settingsCardWidget(
                    title: controller.settingsController[2].title,
                    icon: Icons.privacy_tip_outlined,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                // TextButton(
                //   onPressed: () {},
                //   style: TextButton.styleFrom(
                //       primary: Colors.grey[600],
                //       padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                //   child: settingsCardWidget(
                //     title: controller.settingsController[3].title,
                //     icon: Icons.info_outline_rounded,
                //     cardHeight: kBoxHeight,
                //     context: context,
                //   ),
                // ),
                settingsLabelWidget(
                  title: 'Actions',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.grey[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                  onPressed: () => databaseController.deleteUser(context),
                  child: settingsCardWidget(
                    title: controller.settingsController[4].title,
                    icon: Icons.delete_outline,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.grey[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                  onPressed: () async {
                    String toEmail = 'umatter.reboot@gmail.com';
                    final url = 'mailto:$toEmail';

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                  child: settingsCardWidget(
                    title: controller.settingsController[5].title,
                    icon: Icons.report_gmailerrorred_outlined,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.grey[600],
                      padding: const EdgeInsets.symmetric(horizontal: 20.0)),
                  onPressed: () => databaseController.signOut(),
                  child: settingsCardWidget(
                    title: controller.settingsController[6].title,
                    icon: Icons.logout_rounded,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfoWidget(size, name, age, gender, civilstatus) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        height: size.height * 0.2,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                    const Divider(),
                    Text(
                      "Age",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                    const Divider(),
                    Text(
                      "Gender",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                    const Divider(),
                    Text(
                      "Civil Status",
                      style: TextStyle(
                          color: Colors.grey[500], letterSpacing: 0.3),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(),
                    Text(
                      age,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(),
                    Text(
                      gender,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(
                      height: 10,
                    ),
                    const Divider(),
                    Text(
                      civilstatus,
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(),
                Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
