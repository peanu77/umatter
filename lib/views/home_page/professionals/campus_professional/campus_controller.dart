import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/campus_profile_page/campus_info.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/campus_profile_page/campus_professional_profile_page.dart';

class CampusProfessionalPageController {
  List<CampusInfoPage> campusInfoPage = [
    CampusInfoPage(
      title: "College of Law",
      subtitle: "We are who we are",
      color: Colors.orange,
      imgAsset: 'assets/img/cit.png',
      route: const CampusProfessionalProfilePage(),
    ),
    CampusInfoPage(
      title: "College of Information Technology",
      subtitle: "We are Programmers",
      color: Colors.green,
      imgAsset: 'assets/img/cit.png',
      route: const CampusProfessionalProfilePage(),
    ),
    CampusInfoPage(
      title: "Colllege of Manangement",
      subtitle: "",
      color: Colors.pink,
      imgAsset: 'assets/img/cit.png',
      route: const CampusProfessionalProfilePage(),
    ),
    CampusInfoPage(
      title: "College of Arts and Sciences",
      subtitle: "",
      color: Colors.grey,
      imgAsset: 'assets/img/cit.png',
      route: const CampusProfessionalProfilePage(),
    ),
    CampusInfoPage(
      title: "College of Engineering",
      subtitle: "",
      color: Colors.blue,
      imgAsset: 'assets/img/cit.png',
      route: const CampusProfessionalProfilePage(),
    ),
    CampusInfoPage(
      title: "College of Electro Mechanical Technology",
      subtitle: "",
      color: Colors.yellow,
      imgAsset: 'assets/img/cit.png',
      route: const CampusProfessionalProfilePage(),
    ),
    CampusInfoPage(
      title: "College of Technical Education",
      subtitle: "",
      imgAsset: 'assets/img/cit.png',
      color: Colors.deepPurple,
      route: const CampusProfessionalProfilePage(),
    ),
  ];
}
