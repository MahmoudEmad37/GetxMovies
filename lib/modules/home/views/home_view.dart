import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getx_movie_app/modules/home/controller/home_controller.dart';
import 'package:getx_movie_app/modules/home/views/widgets/home_appbar.dart';
import 'package:getx_movie_app/modules/home/views/widgets/home_view_body.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar(),
        body: const HomeBodyWidget(),
      ),
    );
  }
}
