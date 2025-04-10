import 'package:flutter/widgets.dart';
import 'package:getx_movie_app/core/values/app_text_styles.dart';

Widget infoRowWidget(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: RichText(
      text: TextSpan(
        style: AppTextStyles.textwhite,
        children: [
          TextSpan(text: "$title: ", style: AppTextStyles.textwhiteBold),
          TextSpan(text: value),
        ],
      ),
    ),
  );
}
