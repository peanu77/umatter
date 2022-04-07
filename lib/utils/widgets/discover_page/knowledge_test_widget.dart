import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:umatter/utils/const.dart';
import 'package:umatter/views/home_page/discover/knowledge_test/note_page.dart';

class KnowledgeTestWidget extends StatelessWidget {
  final discoverControllerPage;
  final size;
  const KnowledgeTestWidget({Key? key, this.discoverControllerPage, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: kHomeCardPadding,
          child: Card(
            color: kCardMeditate,
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
                            child: Text(
                              discoverControllerPage.discoverPage[1].title,
                              style: kHomeTitleStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              discoverControllerPage.discoverPage[1].desc,
                              style: const TextStyle(
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
                        child: SvgPicture.asset(
                          discoverControllerPage.discoverPage[1].img,
                        ),
                      ),
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
                            builder: (context) => const NotePage())),
                    child: Text(
                      discoverControllerPage.discoverPage[1].btnTxt,
                      style: kHomeCardStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
