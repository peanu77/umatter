import 'package:flutter/material.dart';
import 'package:umatter/controllers/discover_controller/discover_controller_page.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

import '../../../utils/widgets/discover_page/fact_widget.dart';
import '../../../utils/widgets/discover_page/knowledge_test_widget.dart';

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
          title: Text(
            'Discover Page',
            style: Theme.of(context).textTheme.headline4,
          ),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NavBarPage(),
              ),
            ),
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
            FactWidget(
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
