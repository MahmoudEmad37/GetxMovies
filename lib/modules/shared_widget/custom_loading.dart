import 'package:flutter/material.dart';
import 'package:getx_movie_app/core/values/app_color.dart';

class CustomCircleProgress extends StatelessWidget {
  const CustomCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.blue,
      ),
    );
  }
}
