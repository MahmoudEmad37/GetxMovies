import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/localization/local_keys.dart';

import 'package:getx_movie_app/modules/home/controller/home_controller.dart';
import 'package:getx_movie_app/modules/home/views/widgets/home_appbar.dart';
import 'package:mocktail/mocktail.dart';

class HomeControllerMock extends GetxController
    with Mock
    implements HomeController {}

void main() async {
  // final topRatedMovies = [
  //   MovieModel(
  //     adult: false,
  //     backdropPath: '/path1.jpg',
  //     genreIds: [28, 12],
  //     id: 101,
  //     originalLanguage: 'en',
  //     originalTitle: 'The First Movie',
  //     overview: 'A thrilling action movie with suspense and drama.',
  //     popularity: 123.45,
  //     posterPath: '/poster1.jpg',
  //     releaseDate: '2023-09-01',
  //     title: 'First Movie',
  //     video: false,
  //     voteAverage: 7.8,
  //     voteCount: 1023,
  //   ),
  //   MovieModel(
  //     adult: false,
  //     backdropPath: '/path2.jpg',
  //     genreIds: [35, 18],
  //     id: 102,
  //     originalLanguage: 'en',
  //     originalTitle: 'The Second Movie',
  //     overview: 'A heartwarming comedy-drama that will make you laugh and cry.',
  //     popularity: 98.76,
  //     posterPath: '/poster2.jpg',
  //     releaseDate: '2024-01-15',
  //     title: 'Second Movie',
  //     video: false,
  //     voteAverage: 8.2,
  //     voteCount: 875,
  //   ),
  //   MovieModel(
  //     adult: true,
  //     backdropPath: '/path3.jpg',
  //     genreIds: [27, 53],
  //     id: 103,
  //     originalLanguage: 'en',
  //     originalTitle: 'The Third Movie',
  //     overview:
  //         'A dark and intense horror-thriller that will keep you on edge.',
  //     popularity: 110.00,
  //     posterPath: '/poster3.jpg',
  //     releaseDate: '2025-03-22',
  //     title: 'Third Movie',
  //     video: true,
  //     voteAverage: 6.5,
  //     voteCount: 560,
  //   ),
  // ];
  // setUp(() async {});

  group(
    'HomeView',
    () {
      testWidgets(
        'MyWidget has AppBar with title',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            ScreenUtilInit(
              designSize: const Size(
                428,
                926,
              ),
              builder: (context, child) => MaterialApp(
                home: homeAppBar(),
              ),
            ),
          );

          final Finder appBarTitleFinder = find.text(LocalKeys.kAppBarTitle.tr);
          log('appBarTitleFinder: $appBarTitleFinder');
          expect(appBarTitleFinder, findsOneWidget);
        },
      );
      // testWidgets(
      //   'MyWidget has ListView',
      //   (WidgetTester tester) async {
      //     HomeController homeController =
      //         Get.put<HomeController>(HomeControllerMock());
      //     homeController.topRatedMovies = topRatedMovies;
      //     when(() => homeController.getAllData())
      //         .thenAnswer((_) async => topRatedMovies);
      //     when(() => homeController.getTopRatedMovies())
      //         .thenAnswer((_) async => topRatedMovies);

      //     await tester.pumpWidget(
      //       ScreenUtilInit(
      //         designSize: const Size(
      //           428,
      //           926,
      //         ),
      //         builder: (context, child) => const MaterialApp(
      //           home: HomeView(),
      //         ),
      //       ),
      //     );

      //     final Finder appBarTitleFinder =
      //         find.byType(GetBuilder<HomeController>);

      //     expect(appBarTitleFinder, findsOneWidget);
      //   },
      // );
    },
  );
}
