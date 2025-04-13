import 'dart:async';
import 'dart:io';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_color.dart';
import 'package:getx_movie_app/core/values/localization/local_keys.dart';
import 'package:getx_movie_app/core/values/request_constants.dart';
import 'package:getx_movie_app/data/services/network_service.dart';

class AppProvider extends GetConnect {
  final RxBool networkStatus = Get.find<NetworkService>().getConnectionStatus();

  @override
  void onInit() {
    super.onInit();
    httpClient.defaultContentType = RequestConstants.kApplicationJson;

    httpClient.followRedirects = true;
    httpClient.timeout = const Duration(
      seconds: 60,
    );
    httpClient.addRequestModifier<dynamic>(
      (request) {
        request.headers['Accept'] = RequestConstants.kApplicationJson;
        request.headers['Content-Type'] = RequestConstants.kApplicationJson;
        return request;
      },
    );
    ever(
      networkStatus,
      networkStatusChanged,
    );
  }

  void networkStatusChanged(
    bool networkStatus,
  ) {
    log('Network status changed: $networkStatus');
    if (networkStatus) {
      Get.snackbar(
        LocalKeys.kNetworkSuccess.tr,
        LocalKeys.kNetworkSuccessMessage.tr,
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );
    } else {
      Get.snackbar(
        LocalKeys.kNetworkError.tr,
        LocalKeys.kNetworkErrorMessage.tr,
        backgroundColor: AppColors.red,
        colorText: AppColors.white,
        duration: const Duration(
          seconds: 2,
        ),
      );
    }
  }

  Future<Response<dynamic>> handleNetworkError(
      Future<Response<dynamic>> response) async {
    Response<dynamic>? result;

    try {
      result = await response;

      log(result.body.toString());

      //ToDo: handle response error
    } catch (error) {
      if (error is SocketException || error is TimeoutException) {
      } else {}
      rethrow;
    }
    return result;
  }

  Future<bool> shouldRetry() async {
    log(networkStatus.value.toString());
    if (networkStatus.value == false) {
      return true;
    }

    return !networkStatus.value;
  }
}
