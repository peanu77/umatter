import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/assessment_page/user_info_page/get_user_data_page.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/models/home_page_model/home_page_info.dart';
import 'package:umatter/views/home_page/meditate/meditate_page.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';
import 'package:umatter/views/home_page/professionals/professionals_page.dart';

class HomePageController {
  List<HomePageInfo> homepageController = [
    HomePageInfo(
      "Assessment",
      "assessment",
      "assets/img/home_page/assessment.svg",
      const UserInfoPage(),
      const Color(0xff4c93a1),
    ),
    HomePageInfo(
      "Discover",
      "They say, in order to effectively deal with such condition you must learn it first...",
      "assets/img/home_page/discover.svg",
      const DiscoverPage(),
      const Color(0xffa94a46),
    ),
    HomePageInfo(
      "Meditate",
      "How’s your day going? it deserves to be treasured...",
      "assets/img/home_page/meditate.svg",
      const MeditatePage(),
      const Color(0xffEBB6B6),
    ),
    HomePageInfo(
      "My Diary",
      "How’s your day going? it deserves to be treasured...",
      "assets/img/home_page/diary.svg",
      const MyDiaryPage(),
      const Color(0xff75BEB1),
    ),
    HomePageInfo(
      "Reach Out",
      "When nothing seems to work, always remember that there’s someone you can reach out to..",
      "assets/img/home_page/professional.svg",
      const ProfessionalDirectoriesPage(),
      const Color(0xffae23cb),
    ),
  ];
}
