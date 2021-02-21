/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:22:15
 * @LastEditTime: 2021-02-19 22:20:06
 */
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:taoju5/bapp/res/b_theme.dart';

import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/routes/bapp_route_middleware.dart';
import 'package:taoju5/config/app_config.dart';
import 'package:taoju5/config/app_env.dart';
// import 'package:taoju5/bapp/ui/widgets/pages/home/home_page.dart';

import 'ui/pages/home/home_binding.dart';

class BApp extends StatelessWidget {
  const BApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: ValueKey(AppEnv.bEnd),
      title: AppConfig.appName ?? "test",
      unknownRoute: BAppPages.unkonw,
      getPages: BAppPages.pages,
      theme: BTheme.lightTheme,
      initialRoute: BAppPages.initial,
      initialBinding: TaojuwuBinding(),
      builder: EasyLoading.init(),
      defaultTransition: Get.defaultTransition,
      popGesture: false,

      // defaultTransition: Transition,
      debugShowCheckedModeBanner: AppConfig.isDebug,

      localizationsDelegates: [
        // CupertinoLocalizationDelegate.delegate,
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
        GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
        GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
      ],
      supportedLocales: [Locale("en"), Locale("zh")],
      routingCallback: BAppRouteMiddleWare.observer,
      navigatorKey: Get.key,
    );
  }
}
