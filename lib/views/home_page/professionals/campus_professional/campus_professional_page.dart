import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/campus_controller.dart';
import 'package:umatter/views/home_page/professionals/campus_professional/campus_profile_page/campus_professional_profile_page.dart';

class CampusProfessionalPage extends StatefulWidget {
  const CampusProfessionalPage({Key? key}) : super(key: key);

  @override
  State<CampusProfessionalPage> createState() => _CampusProfessionalPageState();
}

class _CampusProfessionalPageState extends State<CampusProfessionalPage> {
  final _campusProfessionalController = CampusProfessionalPageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "DMMMSU-MLUC Professional",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[600],
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: _campusProfessionalController.campusInfoPage.length,
          itemBuilder: (context, index) => Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CampusProfessionalProfilePage())),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0)),
                color:
                    _campusProfessionalController.campusInfoPage[index].color,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    _campusProfessionalController
                        .campusInfoPage[index].imgAsset,
                    fit: BoxFit.fill,
                  ),
                ),
                elevation: 1.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
