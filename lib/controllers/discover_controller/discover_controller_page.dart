import 'package:umatter/models/discover_model/discover_info_page.dart';
import 'package:umatter/views/home_page/discover/fact_page/fact_page.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/knowledge_page.dart';

class DiscoverControllerPage {
  List<DiscoverInfoPage> discoverPage = [
    DiscoverInfoPage(
      "Facts",
      "Discover the truth about depression.",
      "assets/img/discover/fact_check.svg",
      const FactPage(),
    ),
    DiscoverInfoPage(
      "Myths",
      "Discover the myths abouts depression.",
      "assets/img/discover/knowledge.svg",
      const KnowledgeCheckPage(),
    ),
    DiscoverInfoPage(
      "Knowledge Test",
      "Enhance your knowledge about depression.",
      "assets/img/discover/knowledge.svg",
      const KnowledgeCheckPage(),
    ),
  ];
}
