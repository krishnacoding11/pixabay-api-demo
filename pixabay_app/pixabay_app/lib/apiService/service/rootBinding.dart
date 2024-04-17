import 'package:get/get.dart';
import 'package:pixabay_app/controller/data_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
