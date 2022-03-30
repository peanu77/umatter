import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/constants/const.dart';

import '../../../../controllers/home_page_controller/home_page_controller.dart';
import '../../professionals/professionals_page.dart';

class MajorInterventionWidget extends StatelessWidget {
  final size;
  const MajorInterventionWidget({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kHomeCardPadding,
          child: Card(
            color: kCardCounsellor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
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
                          SizedBox(
                            width: size.width * 0.5,
                            child: Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: const Text(
                                "Reach Out to a Licensed Professional",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                            width: size.width * 0.5,
                            child: const Text(
                              counsellorDescript,
                              style: TextStyle(
                                fontSize: 16.0,
                                letterSpacing: 0.5,
                                color: kCardContent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.19,
                        width: size.width * 0.3,
                        child: SvgPicture.asset(kCounsellorImg),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: kHomeButton,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ProfessionalDirectoriesPage(),
                      ),
                    ),
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
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
