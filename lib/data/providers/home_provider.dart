import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_constants.dart';
import 'package:getx_movie_app/core/values/endpoints.dart';
import 'package:getx_movie_app/core/values/request_constants.dart';
import 'package:getx_movie_app/data/exceptions/network_exception.dart';
import 'package:getx_movie_app/data/models/all_movies_response_model.dart';
import 'package:getx_movie_app/data/providers/app_provider.dart';

class HomeProvider extends AppProvider {
  Future<AllMoviesResponseModel?> getTopRatedMovies() async {
    Response? response;
    do {
      response = await handleNetworkError(get(
        Endpoints.kGetTopRatedMovie,
        headers: {
          'Accept': RequestConstants.kApplicationJson,
        },
        query: {
          RequestConstants.kApiKey: AppConstants.kApiKey,
          RequestConstants.kLanguage: AppConstants.kLanguage,
          RequestConstants.kPage: "1",
        },
      ));
      log(response.toString());
    } while (await shouldRetry());
    if (!response.isOk) {
      throw NetworkException(
        response,
      );
    }
    return AllMoviesResponseModel.fromJson(
      response.body,
    );
  }
}
