import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/discover/discover_controller_page.dart';

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
          title: Text('Discover Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                // Fact Check
                _buildFactCheck(_size),
                // Knowledge Test
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildFactCheck(_size) => Container(
        height: _size.height * 0.09,
        width: double.infinity,
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: Colors.orange),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_discoverControllerPage.discoverPage[0].title),
            Text(_discoverControllerPage.discoverPage[0].desc),
          ],
        ),
      );
}
