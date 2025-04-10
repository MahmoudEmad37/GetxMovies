import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_padding.dart';
import 'package:getx_movie_app/gen/assets.gen.dart';
import 'package:getx_movie_app/modules/shared_widget/adaptive_layout.dart';
import 'package:getx_movie_app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveLayout(
        mobileScene: Center(
          child: Padding(
            padding: const EdgeInsets.all(
              AppPadding.padding16,
            ),
            child: Assets.images.logo.image(
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
