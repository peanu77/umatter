import 'package:flutter/material.dart';
import 'package:umatter/controllers/discover_controller/discover_controller_page.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/utils/widgets/home_page_card_widget.dart';
import 'package:umatter/views/home_page/nav_bar/navbar_page.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  final controller = DiscoverControllerPage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Discover Page',
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              letterSpacing: 1.0,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.grey[800]),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NavBarPage(),
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              children: [
                homePageCardWidget(
                  title: controller.discoverPage[0].title,
                  subtitle: controller.discoverPage[0].subtitle,
                  btnColor: kbtnColor,
                  logo: controller.discoverPage[0].img,
                  bgLogo: Colors.grey[300],
                  cardColor: Colors.green,
                  context: context,
                  size: size,
                  route: controller.discoverPage[0].route,
                ),
                const SizedBox(height: 20.0),
                homePageCardWidget(
                  title: controller.discoverPage[1].title,
                  subtitle: controller.discoverPage[1].subtitle,
                  btnColor: kbtnColor,
                  logo: controller.discoverPage[1].img,
                  bgLogo: Colors.grey[300],
                  cardColor: Colors.pink,
                  context: context,
                  size: size,
                  route: controller.discoverPage[1].route,
                ),
                const SizedBox(height: 20.0),
                homePageCardWidget(
                  title: controller.discoverPage[2].title,
                  subtitle: controller.discoverPage[2].subtitle,
                  btnColor: kbtnColor,
                  logo: controller.discoverPage[2].img,
                  bgLogo: Colors.grey[300],
                  cardColor: Colors.pink,
                  context: context,
                  size: size,
                  route: controller.discoverPage[2].route,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
