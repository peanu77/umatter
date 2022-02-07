import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umatter/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:umatter/models/navigation_page_models/navbar_model.dart';
import 'package:umatter/views/analytics_page/analytics_page.dart';
import 'package:umatter/views/home_page/home_page.dart';
import 'package:umatter/views/navigation_page/custom_animated_bottom_bar.dart';
import 'package:umatter/views/settings_page/settings_page.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(builder: (dashBoardController) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: dashBoardController.indexTab,
            children: [
              HomePage(),
              AnalyticsPage(),
              SettingsPage(),
            ],
          ),
        ),
        bottomNavigationBar: AnimatedCustomBar(
          containerHeight: 70,
          backgroundColor: Colors.white,
          selectedIndex: dashBoardController.indexTab,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: dashBoardController.tabChangeIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.orangeAccent,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.show_chart),
              title: const Text(
                'Analytics',
              ),
              activeColor: Colors.pink,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
