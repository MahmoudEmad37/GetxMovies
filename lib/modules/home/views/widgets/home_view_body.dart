import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_color.dart';
import 'package:getx_movie_app/core/values/app_constants.dart';
import 'package:getx_movie_app/core/values/app_text_styles.dart';
import 'package:getx_movie_app/core/values/arguments.dart';
import 'package:getx_movie_app/core/values/localization/local_keys.dart';
import 'package:getx_movie_app/modules/home/controller/home_controller.dart';
import 'package:getx_movie_app/modules/shared_widget/adaptive_layout.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_loading.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_text.dart';
import 'package:getx_movie_app/routes/app_pages.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => AdaptiveLayout(
        mobileScene: LiquidPullToRefresh(
          onRefresh: () => homeController.getAllData(),
          height: 0.1.sh,
          color: AppColors.offblue,
          child: Obx(
            () => homeController.isLoading.value == true
                ? Container(
                    height: 0.7.sh,
                    alignment: Alignment.center,
                    child: const CustomCircleProgress(),
                  )
                : ListView(
                    children: homeController.topRatedMovies!.map((movie) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 20.w),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.movieDetails,
                                arguments: {Arguments.movieId: movie.id});
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 20.w,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      movie.title ?? LocalKeys.kNoTitle.tr,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: AppTextStyles.titleBlack,
                                    ),
                                    CustomText(
                                      '${LocalKeys.kReleaseDate}: ${movie.releaseDate}',
                                      style: AppTextStyles.subtitleBlack,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120.h,
                                width: 90.w,
                                child: Image.network(
                                  '${AppConstants.kHomePoster}${movie.posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
          ),
        ),
      ),
    );
  }
}
