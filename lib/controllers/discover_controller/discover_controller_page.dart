import 'package:umatter/models/discover_model/discover_info_page.dart';

class DiscoverControllerPage {
  List<DiscoverInfoPage> discoverPage = [
    DiscoverInfoPage("Fact", "Discover the Facts about Depression",
        "Fact Check!", "assets/img/discover/fact_check.svg"),
    DiscoverInfoPage(
        "Knowledge Test",
        "Let us improve your knowledge about depression.",
        "Test my knowledge!",
        "assets/img/discover/knowledge.svg"),
  ];
}
