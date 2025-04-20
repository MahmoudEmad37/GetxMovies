import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_constants.dart';
import 'package:getx_movie_app/core/values/endpoints.dart';
import 'package:getx_movie_app/data/exceptions/network_exception.dart';
import 'package:getx_movie_app/data/models/all_movies_response_model.dart';
import 'package:getx_movie_app/data/models/movie_model.dart';
import 'package:getx_movie_app/data/providers/home_provider.dart';
import 'package:getx_movie_app/data/services/network_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:getx_movie_app/core/values/request_constants.dart';

class MockHttpClient extends Mock implements GetHttpClient {}

void main() {
  late HomeProvider homeProvider;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    Get.put(NetworkService());
    homeProvider = HomeProvider(
      getDefaultHttpClient: mockHttpClient,
    );
  });

  group('getTopRatedMovies', () {
    test('getTopRatedMovies', () async {
      final mockTopRatedMovie = AllMoviesResponseModel(
        topRatedMovies: [
          MovieModel(
            adult: false,
            backdropPath: '/path1.jpg',
            genreIds: [28, 12],
            id: 101,
            originalLanguage: 'en',
            originalTitle: 'The First Movie',
            overview: 'A thrilling action movie with suspense and drama.',
            popularity: 123.45,
            posterPath: '/poster1.jpg',
            releaseDate: '2023-09-01',
            title: 'First Movie',
            video: false,
            voteAverage: 7.8,
            voteCount: 1023,
          ),
          MovieModel(
            adult: false,
            backdropPath: '/path2.jpg',
            genreIds: [35, 18],
            id: 102,
            originalLanguage: 'en',
            originalTitle: 'The Second Movie',
            overview:
                'A heartwarming comedy-drama that will make you laugh and cry.',
            popularity: 98.76,
            posterPath: '/poster2.jpg',
            releaseDate: '2024-01-15',
            title: 'Second Movie',
            video: false,
            voteAverage: 8.2,
            voteCount: 875,
          ),
          MovieModel(
            adult: true,
            backdropPath: '/path3.jpg',
            genreIds: [27, 53],
            id: 103,
            originalLanguage: 'en',
            originalTitle: 'The Third Movie',
            overview:
                'A dark and intense horror-thriller that will keep you on edge.',
            popularity: 110.00,
            posterPath: '/poster3.jpg',
            releaseDate: '2025-03-22',
            title: 'Third Movie',
            video: true,
            voteAverage: 6.5,
            voteCount: 560,
          ),
        ],
      );
      final response =
          Response(statusCode: 200, body: mockTopRatedMovie.toJson());
      when(
        () => mockHttpClient.get(
          Endpoints.kGetTopRatedMovie,
          headers: (any(named: 'headers')),
          query: {
            RequestConstants.kApiKey: AppConstants.kApiKey,
            RequestConstants.kLanguage: AppConstants.kLanguage,
            RequestConstants.kPage: "1",
          },
        ),
      ).thenAnswer((_) async {
        return response;
      });
      final result = await homeProvider.getTopRatedMovies();
      expect(result, isA<AllMoviesResponseModel>());

      expect(
        result!.topRatedMovies,
        isA<List<MovieModel>>().having((movie) => movie[0].id, "id", 101),
      );
    });

    test(
      'getTopRatedMovies error',
      () async {
        const errorResponse = Response(
          statusCode: 404,
          body: '{}',
        );
        when(
          () => mockHttpClient.get(
            Endpoints.kGetTopRatedMovie,
            headers: (any(named: 'headers')),
            query: {
              RequestConstants.kApiKey: AppConstants.kApiKey,
              RequestConstants.kLanguage: AppConstants.kLanguage,
              RequestConstants.kPage: "1",
            },
          ),
        ).thenAnswer(
          (_) async {
            throw NetworkException(errorResponse);
          },
        );
        final newsModel = homeProvider.getTopRatedMovies();
        expect(
          newsModel,
          throwsA(isA<NetworkException>()),
        );
      },
    );
  });
}
