import 'dart:developer';
import 'package:flutter/material.dart';
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
  int page = 1;

  List<MovieModel>? topRatedMovies = <MovieModel>[].obs;

  final RxBool isLoading = RxBool(false);
  final RxBool hasMore = RxBool(true);
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getTopRatedMovies();
      }
    });
    await getAllData();
  }

  getAllData() async {
    page = 1;
    await getTopRatedMovies();
    log('getTopRatedMovies');
    update();
  }

  Future getTopRatedMovies() async {
    isLoading.value = true;
    if (networkStatus.value) {
      try {
        if (hasMore.value) {
          List<MovieModel>? newTopMovies =
              (await homeProvider.getTopRatedMovies(page: page))
                  ?.topRatedMovies;

          if (newTopMovies != null && newTopMovies.isNotEmpty) {
            topRatedMovies?.addAll(newTopMovies);
            localStorageService.saveMovies(topRatedMovies!);
            page++;
          } else {
            hasMore(false);
          }
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
