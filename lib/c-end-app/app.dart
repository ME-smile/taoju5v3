/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:54:58
 * @LastEditTime: 2021-02-02 23:13:15
 */
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:taoju5/c-end-app/ui/pages/home/home_page.dart';
import 'package:taoju5/config/app_config.dart';
import 'package:taoju5/config/app_env.dart';

import 'routes/capp_pages.dart';

class CEndAPP extends StatelessWidget {
  const CEndAPP({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(constraints,
            designSize: Size(750, 1334), allowFontScaling: false);
        return GetMaterialApp(
          key: ValueKey(AppEnv.cEnd),
          title: AppConfig.appName,
          getPages: CAppPages.pages,
          home: CHomePage(),
          defaultTransition: Get.defaultTransition,
          popGesture: false,
          // defaultTransition: Transition,

          localizationsDelegates: [
            // CupertinoLocalizationDelegate.delegate,
            GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
            GlobalMaterialLocalizations.delegate, // 指定本地化的字符串和一些其他的值
            GlobalCupertinoLocalizations.delegate, // 对应的Cupertino风格
            GlobalWidgetsLocalizations.delegate // 指定默认的文本排列方向, 由左到右或由右到左
          ],
          supportedLocales: [Locale("en"), Locale("zh")],
          navigatorKey: Get.key,
        );
      },
    );
  }
}
