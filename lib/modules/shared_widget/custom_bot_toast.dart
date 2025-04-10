import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:getx_movie_app/core/values/app_color.dart';
import 'package:getx_movie_app/core/values/app_padding.dart';
import 'package:getx_movie_app/core/values/localization/local_keys.dart';

class CustomBotToast {
  static void showGenericErrorText() {
    BotToast.showText(
      duration: const Duration(
        seconds: 3,
      ),
      text: LocalKeys.kGenericErrorMessage.tr,
      contentColor: AppColors.red,
      contentPadding: const EdgeInsets.all(
        AppPadding.padding8,
      ),
    );
  }
}
