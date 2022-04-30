import 'package:umatter/views/home_page/reach_out/directories_model.dart';

import 'campus_professional/campus_professional_page.dart';
import 'external_directories/external_directories.dart';
import 'mental_health_communities.dart';

class ProfessionalControllerPage {
  List<ProfessionalInfoPage> professionalInfoController = [
    ProfessionalInfoPage(
      route: const CampusProfessionalPage(),
      title: "DMMMSU-MLUC Professionals",
      subtitle:
          "Visit the list of available campus professionals that may help you.",
      color: 0xff555b6e,
    ),
    ProfessionalInfoPage(
      route: const ExternalDirectoriesPage(),
      title: "Department of Health Directories",
      subtitle: "Feel free to talk to the Department of Health Professionals.",
      color: 0xffe4be9e,
    ),
    ProfessionalInfoPage(
      route: const MentalHealthCommunitiesPage(),
      title: "Mental Health Communities",
      subtitle:
          "We provide the list of available communnities out ther for you to visit and interact with the professionals.",
      color: 0xff3c6e71,
    ),
  ];
}
