import 'package:flutter/material.dart';
import 'package:umatter/components/app_bar_component.dart';
import 'package:umatter/controllers/professionals_page_controller/external_directories_page_controller.dart';
import 'package:umatter/views/home_page/my_diary/page/constant/diary_constant.dart';

import '../../../components/widgets/professional_page/professional_card_widget.dart';

import '../nav_bar/navbar_page.dart';
import 'directories_controller.dart';

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
  final _professionalController = ProfessionalControllerPage();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'List of Directories',
            style: kAppBarTitle,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NavBarPage())),
            icon: Icon(Icons.chevron_left, color: Colors.grey[600]),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: _professionalController.professionalInfoController.length,
          itemBuilder: (context, index) => professionalCardWidget(
            context: context,
            width: double.infinity,
            title:
                _professionalController.professionalInfoController[index].title,
            subtitle: _professionalController
                .professionalInfoController[index].subtitle,
            cardColor: Color(_professionalController
                .professionalInfoController[index].color),
            btnText: "Continue",
            btnColor: kPrimary,
            route:
                _professionalController.professionalInfoController[index].route,
          ),
        ),
      ),
    );
  }
}
