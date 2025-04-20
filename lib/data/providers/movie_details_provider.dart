import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_constants.dart';
import 'package:getx_movie_app/core/values/endpoints.dart';
import 'package:getx_movie_app/data/exceptions/network_exception.dart';
import 'package:getx_movie_app/data/models/movie_details_model.dart';
import 'package:getx_movie_app/data/providers/app_provider.dart';
import 'package:getx_movie_app/core/values/request_constants.dart';

class MovieDetailsProvider extends AppProvider {
  Future<MovieDetailsModel?> getMovieDetails({required int id}) async {
    Response? response;
    do {
      response = await handleNetworkError(
        get(
          '${Endpoints.kGetMovieDetails}/$id',
          headers: {
            'Accept': RequestConstants.kApplicationJson,
          },
          query: {
            RequestConstants.kApiKey: AppConstants.kApiKey,
            RequestConstants.kLanguage: AppConstants.kLanguage,
          },
        ),
      );
      log(response.toString());
    } while (await shouldRetry());
    if (!response.isOk) {
      throw NetworkException(
        response,
      );
    }
    return MovieDetailsModel.fromJson(
      response.body,
    );
  }
}
