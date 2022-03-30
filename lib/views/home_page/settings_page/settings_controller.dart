import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/settings_page/settings_info.dart';

class SettingsControllerPage {
  List<SettingsInfoPage> settingsController = [
    SettingsInfoPage(
        title: "Notification",
        icon: const Icon(Icons.notifications_none),
        actionIcon: const Icon(Icons.chevron_right)),
    SettingsInfoPage(
        title: "Report a Problem",
        icon: const Icon(Icons.report_gmailerrorred_outlined),
        actionIcon: const Icon(Icons.chevron_right)),
    SettingsInfoPage(
        title: "Terms and Conditions",
        icon: const Icon(Icons.privacy_tip_outlined),
        actionIcon: const Icon(Icons.chevron_right)),
    SettingsInfoPage(
        title: "Privacy and Policy",
        icon: const Icon(Icons.privacy_tip_outlined),
        actionIcon: const Icon(Icons.chevron_right)),
    SettingsInfoPage(
        title: "Delete Account",
        icon: const Icon(Icons.delete_outline),
        actionIcon: const Icon(Icons.chevron_right)),
    SettingsInfoPage(
        title: "Logout",
        icon: const Icon(Icons.logout),
        actionIcon: const Icon(Icons.chevron_right)),
  ];
}
