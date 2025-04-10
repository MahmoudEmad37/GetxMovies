import 'package:getx_movie_app/data/models/genres_model.dart';
import 'package:getx_movie_app/data/models/production_companies_model.dart';
import 'package:getx_movie_app/data/models/production_countries_model.dart';
import 'package:getx_movie_app/data/models/spoken_languages_model.dart';

class MovieDetailsModel {
  bool? adult;
  String? backdropPath;
  int? budget;
  List<GenresModel>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompaniesModel>? productionCompanies;
  List<ProductionCountriesModel>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguagesModel>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieDetailsModel(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdbId,
      this.originCountry,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = <GenresModel>[];
      json['genres'].forEach((v) {
        genres!.add(GenresModel.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompaniesModel>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(ProductionCompaniesModel.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      productionCountries = <ProductionCountriesModel>[];
      json['production_countries'].forEach((v) {
        productionCountries!.add(ProductionCountriesModel.fromJson(v));
      });
    }
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    if (json['spoken_languages'] != null) {
      spokenLanguages = <SpokenLanguagesModel>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages!.add(SpokenLanguagesModel.fromJson(v));
      });
    }
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
