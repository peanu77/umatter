import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/home_page.dart';
import 'package:umatter/views/home_page/settings_page/settings_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:umatter/views/quotes_page/quotes_page.dart';

import '../analytics/analytics_page.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({Key? key}) : super(key: key);

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  List pages = const [
    HomePage(),
    // AssessmentAnalytics(),
    QuotesPage(),
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
            // BottomNavigationBarItem(
            //   label: "Analytics",
            //   tooltip: "Analytics",
            //   icon: FaIcon(FontAwesomeIcons.chartLine),
            // ),
            BottomNavigationBarItem(
              label: "Quotes",
              tooltip: "Quotes",
              icon: FaIcon(
                FontAwesomeIcons.quoteLeft,
                semanticLabel: "Quotes",
              ),
            ),
            BottomNavigationBarItem(
              label: "Settings",
              tooltip: "Settings",
              icon: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}
