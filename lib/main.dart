import 'package:bot_toast/bot_toast.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_movie_app/core/values/app_color.dart';
import 'package:getx_movie_app/core/values/localization/messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:getx_movie_app/data/models/movie_model.dart';
import 'package:getx_movie_app/data/services/local_storage_service.dart';
import 'package:getx_movie_app/data/services/network_service.dart';
import 'package:getx_movie_app/gen/fonts.gen.dart';
import 'package:getx_movie_app/routes/app_pages.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieModelAdapter());

  WidgetsBinding.instance.addPostFrameCallback(
    (_) {
      SystemChrome.setApplicationSwitcherDescription(
        ApplicationSwitcherDescription(
          label: 'Movie App',
          primaryColor: AppColors.white.value,
        ),
      );
    },
  );

  initServices();

  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return ScreenUtilInit(
      designSize: const Size(
        428,
        926,
      ),
      useInheritedMediaQuery: false,
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Movie App',
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: ThemeData(
            fontFamily: FontFamily.cairo,
          ),
          useInheritedMediaQuery: true,
          builder: (context, child) {
            child = DevicePreview.appBuilder(
              context,
              child,
            );
            child = botToastBuilder(
              context,
              child,
            );
            return child;
          },
          navigatorObservers: [
            BotToastNavigatorObserver(),
          ],
          locale: const Locale("en"),
          translations: Messages(),
          fallbackLocale: Messages.fallbackLocale,
          supportedLocales: Messages.supportedLocales,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
    );
  }
}

void initServices() {
  Get.put(NetworkService());
  Get.put(LocalStorageService());
}
