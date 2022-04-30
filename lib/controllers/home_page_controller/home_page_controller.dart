import 'package:flutter/material.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/views/home_page/assessment_page/assessment_disclaimer.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';
import 'package:umatter/models/home_page_model/home_page_info.dart';
import 'package:umatter/views/home_page/meditate/meditate_page.dart';
import 'package:umatter/views/home_page/my_diary/my_diary_page.dart';

import '../../views/home_page/reach_out/directories_page.dart';

class HomePageController {
  List<HomePageInfo> homepageController = [
    HomePageInfo(
      "Assessment",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "assets/img/home_page/assessment.svg",
      const AssessmentDisclaimerPage(),
      kCardAssessment,
    ),
    HomePageInfo(
      "Discover",
      "Discover the stuff you need to know around Depression.",
      "assets/img/home_page/discover.svg",
      const DiscoverPage(),
      kCardDiscover,
    ),
    HomePageInfo(
      "Meditate",
      "Play & Listen. Music ’ve got your back!",
      "assets/img/home_page/meditate.svg",
      const MeditatePage(),
      // const Color(0xf6082b6),
      kCardMeditate,
    ),
    HomePageInfo(
      "Mood Journal",
      "Check anything new with you. Feel free to write it down.",
      "assets/img/home_page/diary.svg",
      const MyDiaryPage(),
      kCardMoodJournal,
    ),
    HomePageInfo(
      "Reach Out",
      "Talk to someone with our Directory of Professionals.",
      "assets/img/home_page/professional.svg",
      const ProfessionalDirectoriesPage(),
      kCardReachOut,
    ),
  ];
}
