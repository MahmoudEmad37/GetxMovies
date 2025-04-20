import 'package:get/get.dart';
import 'package:getx_movie_app/modules/home/bindings/home_binding.dart';
import 'package:getx_movie_app/modules/home/views/home_view.dart';
import 'package:getx_movie_app/modules/movie_details/binding/movie_details_binding.dart';
import 'package:getx_movie_app/modules/movie_details/view/movie_details_view.dart';
import 'package:getx_movie_app/modules/splash/bindings/splash_bindind.dart';
import 'package:getx_movie_app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.movieDetails,
      page: () => const MovieDetailsView(),
      binding: MovieDetailsBinding(),
    ),
  ];
}
