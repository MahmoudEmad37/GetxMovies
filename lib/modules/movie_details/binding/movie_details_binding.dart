import 'package:get/instance_manager.dart';
import 'package:getx_movie_app/data/providers/movie_details_provider.dart';
import 'package:getx_movie_app/modules/movie_details/controller/movie_details_controller.dart';

class MovieDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailsProvider());
    Get.lazyPut(() => MovieDetailsController());
  }
}
