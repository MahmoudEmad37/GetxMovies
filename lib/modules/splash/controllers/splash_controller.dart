import 'package:get/get.dart';
import 'package:getx_movie_app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(
      const Duration(
        seconds: 5,
      ),
    );
    Get.offAllNamed(Routes.home);
  }
}
