import 'package:get/get.dart';
import 'package:getx_movie_app/data/providers/home_provider.dart';
import 'package:getx_movie_app/modules/home/controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeProvider(),
    );
    Get.lazyPut(
      () => HomeController(),
    );
  }
}
