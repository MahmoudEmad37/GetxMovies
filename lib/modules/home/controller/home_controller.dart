import 'dart:developer';
import 'package:get/get.dart';
import 'package:getx_movie_app/data/models/movie_model.dart';
import 'package:getx_movie_app/data/providers/home_provider.dart';
import 'package:getx_movie_app/data/services/local_storage_service.dart';
import 'package:getx_movie_app/data/services/network_service.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_bot_toast.dart';

class HomeController extends GetxController {
  final homeProvider = Get.find<HomeProvider>();
  final localStorageService = Get.find<LocalStorageService>();
  final RxBool networkStatus = Get.find<NetworkService>().hasConnection;

  List<MovieModel>? topRatedMovies = [];

  final RxBool isLoading = RxBool(false);

  @override
  void onInit() async {
    super.onInit();
    await getAllData();
  }

  getAllData() async {
    await getTopRatedMovies();
    update();
  }

  Future getTopRatedMovies() async {
    isLoading.value = true;
    if (networkStatus.value) {
      try {
        topRatedMovies =
            (await homeProvider.getTopRatedMovies())?.topRatedMovies;
        if (topRatedMovies != null && topRatedMovies!.isNotEmpty) {
          localStorageService.saveMovies(topRatedMovies!);
        }
        isLoading.value = false;
      } catch (error) {
        CustomBotToast.showGenericErrorText();
        isLoading.value = false;
      }
    } else {
      log('No internet connection, loading from local storage');
      try {
        topRatedMovies = localStorageService.getMovies();
        isLoading.value = false;
      } catch (error) {
        CustomBotToast.showGenericErrorText();
      }
      isLoading.value = false;
    }
  }
}
