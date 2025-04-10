import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/local_storage_constants.dart';
import 'package:getx_movie_app/data/models/movie_model.dart';
import 'package:hive/hive.dart';

class LocalStorageService extends GetxService {
  late Box<List> _box;

  @override
  void onInit() async {
    super.onInit();
    await Hive.openBox<List>(LocalStorageConstants.kMovieBox);
    _box = Hive.box<List>(LocalStorageConstants.kMovieBox);
  }

  Future<void> saveMovies(List<MovieModel> movies) async {
    await _box.put(LocalStorageConstants.kMovieBox, movies);
  }

  List<MovieModel> getMovies() {
    return _box.get(LocalStorageConstants.kMovieBox,
        defaultValue: [])!.cast<MovieModel>();
  }
}
