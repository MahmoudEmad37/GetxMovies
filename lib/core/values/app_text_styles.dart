import 'package:flutter/material.dart';
import 'package:getx_movie_app/core/values/app_color.dart';

class AppTextStyles {
  const AppTextStyles._();
  static TextStyle appBar = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5,
  );
  static TextStyle titleBlack = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );
  static TextStyle subtitleBlack = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle titleWhite = const TextStyle(
    fontSize: 26,
    color: AppColors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subtitleOffWhite = const TextStyle(
    fontSize: 18,
    fontStyle: FontStyle.italic,
    color: AppColors.textColor,
  );
  static TextStyle subtitleWhite = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static TextStyle overviewText = const TextStyle(
    fontSize: 14,
    color: AppColors.textColor,
  );

  static TextStyle textwhite = const TextStyle(
    fontSize: 14,
    color: AppColors.white,
  );
  static TextStyle textwhiteBold = const TextStyle(
      fontSize: 12, color: AppColors.white, fontWeight: FontWeight.bold);
}
