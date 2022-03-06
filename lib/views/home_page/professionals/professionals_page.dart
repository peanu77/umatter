import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/controllers/professionals_page_controller/external_directories_page_controller.dart';
import 'package:umatter/models/contants/constants.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/professional_page.dart';
import 'package:umatter/views/home_page/professionals/external_directories.dart';
import 'package:umatter/views/home_page/professionals/mental_health_communities.dart';

class ProfessionalDirectoriesPage extends StatefulWidget {
  const ProfessionalDirectoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfessionalDirectoriesPage> createState() =>
      _ProfessionalDirectoriesPage();
}

class _ProfessionalDirectoriesPage extends State<ProfessionalDirectoriesPage> {
  final interventionPage = InterventionPageController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Directories',
            style: TextStyle(color: Colors.black)),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const NavBarPage(),
            ),
          ),
          icon: const Icon(Icons.chevron_left, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _size.height * 0.35,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Lottie.asset('assets/icons/json/talk.json'),
                ),
              ),
              _buildCampusProfessional(_size),
              _buildExternalDirectories(_size),
              _buildCommunity(_size),
            ],
          ),
        ),
      ),
    );
  }

  _buildCampusProfessional(Size size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: Colors.green.shade300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Campus Professionals",
                                style: kTitle,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: size.width * 0.8,
                              child: const Text(
                                'Visit the list of available campus professionals that may help you',
                                style: kDesc,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () =>
                          Get.to(() => const CampusProfessionalsPage()),
                      child: const Text('Let\'s Go!', style: kBtnFnt),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );

  _buildExternalDirectories(Size size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Department of Health Directories",
                                style: kTitle,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: size.width * 0.8,
                              child: const Text(
                                'Feel free to talk to the Departmen of Health professionals.',
                                style: kDesc,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () =>
                          Get.to(() => const ExternalDirectoriesPage()),
                      child: const Text(
                        'Let\'s Go!',
                        style: kBtnFnt,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  _buildCommunity(Size size) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 5.0,
            ),
            child: Card(
              color: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 8.0,
                      top: 15.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Mental Health Communities",
                                style: kTitle,
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              width: size.width * 0.8,
                              child: const Text(
                                'We provide the list of available communities out there for you to visit and interact to other people like you or interact with the professionals.',
                                style: kDesc,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: kElevatedbtnprimary,
                      onPressed: () =>
                          Get.to(() => const MentalHealthCommunitiesPage()),
                      child: const Text(
                        'Let\'s Go!',
                        style: kBtnFnt,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
