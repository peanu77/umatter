import 'package:flutter/material.dart';
import 'package:umatter/views/analytics_page/analytics_page.dart';
import 'package:umatter/views/home_page/home_page.dart';
import 'package:umatter/views/home_page/settings_page/settings_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  List pages = const [
    HomePage(),
    AnalyticsPage(),
    SettingsPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          elevation: 0.0,
          selectedFontSize: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              label: "HomePage",
              tooltip: "Home Page",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "HomePage",
              tooltip: "Analytics",
              icon: Icon(Icons.bar_chart),
            ),
            BottomNavigationBarItem(
              label: "HomePage",
              tooltip: "Settings",
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
