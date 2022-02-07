import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var indexTab = 0;

  // This method will be responsible for the navigation  bar
  void tabChangeIndex(int index) {
    indexTab = index;
    update();
  }
}
