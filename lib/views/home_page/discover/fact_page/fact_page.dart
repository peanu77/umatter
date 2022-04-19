import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:umatter/controllers/discover_controller/fact_controller.dart';
import 'package:umatter/utils/colors.dart';

class FactPage extends StatefulWidget {
  const FactPage({Key? key}) : super(key: key);

  @override
  State<FactPage> createState() => _FactPageState();
}

class _FactPageState extends State<FactPage> {
  final controller = FactCheckController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.chevron_left,
              color: Colors.grey[500],
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.grey[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Depression Facts'.toUpperCase(),
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(
              height: 500,
              child: Swiper(
                itemCount: controller.factCheckInfo.length,
                itemWidth: size.width - 2 * 65,
                layout: SwiperLayout.STACK,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 15,
                    activeColor: kbtnColor,
                    color: Colors.grey[400],
                    space: 5,
                  ),
                ),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 100.0,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 5.0,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                    vertical: 20.0,
                                  ),
                                  height: size.height * 0.4,
                                  width: size.width * 0.7,
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: Text(
                                        controller.factCheckInfo[index].desc,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
