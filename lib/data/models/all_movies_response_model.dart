import 'package:getx_movie_app/data/models/movie_model.dart';

class AllMoviesResponseModel {
  int? page;
  List<MovieModel>? topRatedMovies;
  int? totalPages;
  int? totalResults;

  AllMoviesResponseModel(
      {this.page, this.topRatedMovies, this.totalPages, this.totalResults});

  AllMoviesResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      topRatedMovies = <MovieModel>[];
      json['results'].forEach((v) {
        topRatedMovies!.add(MovieModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
