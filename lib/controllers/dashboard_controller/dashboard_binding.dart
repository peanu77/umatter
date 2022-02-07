import 'package:get/get.dart';
import 'package:umatter/controllers/dashboard_controller/dashboard_controller.dart';
import 'package:umatter/controllers/home_page_controller/home_page_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(() => DashBoardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
  }
}
