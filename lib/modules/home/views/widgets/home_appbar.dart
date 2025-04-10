import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:getx_movie_app/core/values/app_color.dart';
import 'package:getx_movie_app/core/values/app_text_styles.dart';
import 'package:getx_movie_app/core/values/localization/local_keys.dart';
import 'package:getx_movie_app/modules/shared_widget/custom_text.dart';

AppBar homeAppBar() {
  return AppBar(
    title: CustomText(LocalKeys.kAppBarTitle.tr, style: AppTextStyles.appBar),
    backgroundColor: AppColors.lightTeal,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20.r),
      ),
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.teal, AppColors.lightTeal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20.r),
        ),
      ),
    ),
  );
}
