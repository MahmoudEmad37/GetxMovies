import 'package:get/get.dart';
import 'package:getx_movie_app/modules/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
