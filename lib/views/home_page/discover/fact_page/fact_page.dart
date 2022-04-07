import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/widgets/discover_page/fact_page_widget.dart';

import '../../../../controllers/discover_controller/fact_controller.dart';

class FactPage extends StatelessWidget {
  const FactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _factCheck = FactCheckController();
    final _pageController = PageController(initialPage: 0);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left),
            color: Colors.grey[600],
          ),
          title: Text(
            "Discover the Facts",
            style: TextStyle(color: Colors.grey[600]),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          children: [
            // _page1(_factCheck),
            factPageWidget(
              subtitle: _factCheck.factCheckInfo[0].desc,
              icon: const Icon(Icons.add),
              bgColor: const Color(0xff255D83),
              topRight: 200.0,
              topLeft: 100.0,
              bottomRight: 100.0,
              bottomLeft: 170.0,
              pHorizontal: 70.0,
              pVertical: 70.0,
            ),
            factPageWidget(
              subtitle: _factCheck.factCheckInfo[1].desc,
              icon: const Icon(Icons.add),
              bgColor: const Color(0xff735983),
              topRight: 30.0,
              topLeft: 70.0,
              bottomRight: 150.0,
              bottomLeft: 40.0,
              pHorizontal: 60.0,
              pVertical: 70.0,
            ),
            factPageWidget(
              subtitle: _factCheck.factCheckInfo[2].desc,
              icon: const Icon(Icons.add),
              bgColor: const Color(0xffCC6686),
              topRight: 70.0,
              topLeft: 0.0,
              bottomRight: 0.0,
              bottomLeft: 90.0,
              pHorizontal: 50.0,
              pVertical: 50.0,
            ),
            factPageWidget(
              subtitle: _factCheck.factCheckInfo[3].desc,
              icon: const Icon(Icons.add),
              bgColor: const Color(0xffFF687E),
              topRight: 150.0,
              topLeft: 150.0,
              bottomRight: 170.0,
              bottomLeft: 50.0,
              pHorizontal: 60.0,
              pVertical: 60.0,
            ),
            factPageWidget(
              subtitle: _factCheck.factCheckInfo[4].desc,
              icon: const Icon(Icons.add),
              bgColor: const Color(0xffFFAF87),
              topRight: 150.0,
              topLeft: 230.0,
              bottomRight: 180.0,
              bottomLeft: 50.0,
              pHorizontal: 60.0,
              pVertical: 50.0,
            ),
            factPageWidget(
              subtitle: _factCheck.factCheckInfo[5].desc,
              icon: const Icon(Icons.add),
              bgColor: const Color(0xff4D6466),
              topRight: 190.0,
              topLeft: 40.0,
              bottomRight: 120.0,
              bottomLeft: 190.0,
              pHorizontal: 50.0,
              pVertical: 50.0,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: FloatingActionButton(
            tooltip: "Move to Top",
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            onPressed: () => _pageController.animateTo(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceIn),
            child: Icon(
              Icons.expand_less,
              color: Colors.grey[600],
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
