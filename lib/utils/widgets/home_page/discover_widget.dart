import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/controllers/home_page_controller/home_page_controller.dart';
import 'package:umatter/utils/const.dart';
import 'package:umatter/views/home_page/discover/discover_page.dart';

class DiscoverWidget extends StatelessWidget {
  final size;
  const DiscoverWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: kHomeCardPadding,
          child: Card(
            color: kCardDiscover,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 8.0,
                    top: 15.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              "Discover",
                              style: kHomeTitleStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                            width: _size.width * 0.5,
                            child: const Text(
                              discoverDescript,
                              style: TextStyle(
                                fontSize: 16.0,
                                letterSpacing: 1.0,
                                color: kCardContent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.19,
                        width: size.width * 0.3,
                        child: SvgPicture.asset(kDiscoverImg),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: kHomeButton,
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const DiscoverPage())),
                    child: const Text(
                      'Let\'s Dive In',
                      style: kHomeCardStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
