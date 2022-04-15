import 'package:umatter/views/home_page/professionals/campus_professional/campus_professional_page.dart';
import 'package:umatter/views/home_page/professionals/external_directories/external_directories.dart';
import 'package:umatter/views/home_page/professionals/mental_health_communities.dart';
import 'package:umatter/views/home_page/professionals/professional_info.dart';

class ProfessionalControllerPage {
  List<ProfessionalInfoPage> professionalInfoController = [
    ProfessionalInfoPage(
      route: const CampusProfessionalPage(),
      title: "DMMMSU-MLUC Professionals",
      subtitle:
          "Visit the list of available campus professionals that may help you!",
      color: 0xffA977AF,
    ),
    ProfessionalInfoPage(
      route: const ExternalDirectoriesPage(),
      title: "Department of Health Directories",
      subtitle: "Feel free to talk to the Department of Health Professionals",
      color: 0xff708E79,
    ),
    ProfessionalInfoPage(
      route: const MentalHealthCommunitiesPage(),
      title: "Mental Health Communities",
      subtitle:
          "We provide the list of available communnities out ther for you to visit and interact with the professionals",
      color: 0xff9F9686,
    ),
  ];
}
