import 'package:flutter/material.dart';
import 'package:umatter/auth/database_manager.dart';
import 'package:umatter/views/home_page/settings_page/settings_card_widget.dart';
import 'package:umatter/views/home_page/settings_page/settings_controller.dart';
import 'package:umatter/views/home_page/settings_page/settings_label_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final kBoxHeight = size.height * 0.09;
    final controller = SettingsControllerPage();
    final databaseController = DatabaseManager();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings Page',
          style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                settingsLabelWidget(
                  title: 'Personal Information',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                _buildUserInfo(size),
                settingsLabelWidget(
                  title: 'Permissions',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
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
                  fontColor: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
                  onPressed: () {},
                  child: settingsCardWidget(
                    title: controller.settingsController[1].title,
                    icon: Icons.description_outlined,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
                  onPressed: () {},
                  child: settingsCardWidget(
                    title: controller.settingsController[2].title,
                    icon: Icons.privacy_tip_outlined,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
                  onPressed: () {},
                  child: settingsCardWidget(
                    title: controller.settingsController[3].title,
                    icon: Icons.info_outline_rounded,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                settingsLabelWidget(
                  title: 'Actions',
                  width: 20.0,
                  height: 20.0,
                  fontSize: 18.0,
                  fontColor: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.3,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
                  onPressed: () => databaseController.deleteUser(),
                  child: settingsCardWidget(
                    title: controller.settingsController[4].title,
                    icon: Icons.delete_outline,
                    cardHeight: kBoxHeight,
                    context: context,
                  ),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
                  onPressed: () async {
                    String toEmail = '4admiraks@gmail.com';
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
                OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.grey[600]),
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

  _buildUserInfo(size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                      "Username",
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
                      "peanuts",
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "21",
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Male",
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
                      "Single",
                      style: TextStyle(
                        color: Colors.grey[700],
                        letterSpacing: 0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
