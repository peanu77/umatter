import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/discover/discover_controller_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';
import '../widgets/discover_page/fact_check_widget.dart';
import '../widgets/discover_page/knowledge_test_widget.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final _discoverControllerPage = DiscoverControllerPage();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NavBarPage(),
              ),
            ),
          ),
          title: Text(
            'Discover Page',
            style: Theme.of(context).textTheme.headline4,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 15.0,
            ),
            // FactCheck  Widget
            FactCheckWidget(
              size: _size,
              discoverControllerPage: _discoverControllerPage,
            ),
            // Knowledge Test Widget
            KnowledgeTestWidget(
                discoverControllerPage: _discoverControllerPage, size: _size),
            // Size Separator
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
