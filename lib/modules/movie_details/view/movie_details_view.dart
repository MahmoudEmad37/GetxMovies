import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_color.dart';
import 'package:getx_movie_app/core/values/app_constants.dart';
import 'package:getx_movie_app/core/values/app_padding.dart';
import 'package:getx_movie_app/core/values/app_text_styles.dart';
import 'package:getx_movie_app/core/values/localization/local_keys.dart';
import 'package:getx_movie_app/modules/movie_details/controller/movie_details_controller.dart';
import 'package:getx_movie_app/modules/movie_details/view/widgets/info_row_widget.dart';
import 'package:getx_movie_app/modules/shared_widget/adaptive_layout.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_errorr.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_onloading_state.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_text.dart';

class MovieDetailsView extends GetView<MovieDetailsController> {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteBackground,
      body: AdaptiveLayout(
        mobileScene: controller.obx(
          (state) => Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.network(
                  '${AppConstants.kbackgroundUrlImage}${state?.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: AppColors.black.withOpacity(0.4),
                ),
              ),

              Positioned.fill(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Poster
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: Image.network(
                            '${AppConstants.kPosterUrlImage}${state?.posterPath}',
                            height: 200.h,
                          ),
                        ),
                      ),
                      Gap(20.h),

                      // Title
                      CustomText(
                        state?.title ?? "",
                        style: AppTextStyles.titleWhite,
                        textAlign: TextAlign.center,
                      ),
                      Gap(8.h),
                      CustomText(
                        state?.tagline ?? "",
                        style: AppTextStyles.subtitleOffWhite,
                        textAlign: TextAlign.center,
                      ),
                      Gap(20.h),

                      // Info card
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(AppPadding.padding16),
                          decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                infoRowWidget(
                                  LocalKeys.genre.tr,
                                  state?.genres
                                          ?.map((genere) => genere.name)
                                          .join(', ') ??
                                      "",
                                ),
                                infoRowWidget(
                                  LocalKeys.released.tr,
                                  state?.releaseDate ?? "",
                                ),
                                infoRowWidget(
                                  LocalKeys.runtime.tr,
                                  "${state?.runtime} ${LocalKeys.minutes.tr}",
                                ),
                                infoRowWidget(
                                  LocalKeys.budget.tr,
                                  "\$${state?.budget.toString()}",
                                ),
                                infoRowWidget(
                                  LocalKeys.revenue.tr,
                                  "\$${state?.revenue.toString()}",
                                ),
                                infoRowWidget(
                                  LocalKeys.rating.tr,
                                  "⭐ ${state?.voteAverage} (${state?.voteCount} ${LocalKeys.votes.tr})",
                                ),
                                Gap(10.h),
                                CustomText(
                                  LocalKeys.overview.tr,
                                  style: AppTextStyles.subtitleWhite,
                                ),
                                Gap(6.h),
                                Text(
                                  state?.overview ?? "",
                                  style: AppTextStyles.overviewText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          onLoading: const CustomOnLoading(),
          onError: (error) => CustomOnError(
            error: error,
          ),
        ),
      ),
    );
  }
}
