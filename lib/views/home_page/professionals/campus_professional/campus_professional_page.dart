import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/campus_controller.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/professional_page_widget.dart';

class CampusProfessionalPage extends StatefulWidget {
  const CampusProfessionalPage({Key? key}) : super(key: key);

  @override
  State<CampusProfessionalPage> createState() => _CampusProfessionalPageState();
}

class _CampusProfessionalPageState extends State<CampusProfessionalPage> {
  final _campusProfessionalPage = CampusProfessionalPageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: _campusProfessionalPage.campusInfoPage.length,
          itemBuilder: (context, index) => professionalPageWidget(
            title: _campusProfessionalPage.campusInfoPage[index].title,
            subtitle: _campusProfessionalPage.campusInfoPage[index].subtitle,
            imgAsset: _campusProfessionalPage.campusInfoPage[index].imgAsset,
            cardColor: _campusProfessionalPage.campusInfoPage[index].color,
            size: _size,
            context: context,
          ),
        ),
      ),
    );
  }
}
