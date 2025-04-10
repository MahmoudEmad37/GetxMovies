import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/arguments.dart';
import 'package:getx_movie_app/data/models/movie_details_model.dart';
import 'package:getx_movie_app/data/providers/movie_details_provider.dart';
import 'package:getx_movie_app/data/services/network_service.dart';

class MovieDetailsController extends GetxController
    with StateMixin<MovieDetailsModel> {
  final RxBool networkStatus = Get.find<NetworkService>().hasConnection;
  final MovieDetailsProvider movieDetailsProvider =
      Get.find<MovieDetailsProvider>();

  late int movieId;

  @override
  void onInit() async {
    super.onInit();
    movieId = Get.arguments[Arguments.movieId];
    await getMovieDetails();
  }

  Future<void> getMovieDetails() async {
    change(null, status: RxStatus.loading());
    if (networkStatus.value) {
      try {
        final MovieDetailsModel? movieDetails =
            await movieDetailsProvider.getMovieDetails(id: movieId);
        if (movieDetails != null) {
          change(movieDetails, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error('No data found'));
        }
      } catch (error) {
        change(null, status: RxStatus.error('Error fetching data'));
      }
    } else {
      change(null, status: RxStatus.error('No internet connection'));
    }
  }
}
