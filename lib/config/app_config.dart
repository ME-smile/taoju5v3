/*
 * @Description: App相关配置
 * @Author: iamsmiling
 * @Date: 2020-12-18 14:20:38
 * @LastEditTime: 2021-02-03 10:17:02
 */

import 'package:flutter/foundation.dart';
import 'package:taoju5/config/app_env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  // app名字
  // static String get appName => isDebug ? '淘居屋商家测试版' : "淘居屋商家";
  static AppEnv env = AppEnv.bEnd;

  ///打包时只需要修改这两个即可
  static AppMode mode = AppMode.debug;

  static String get appName => getAppName(env: env, mode: mode);

  static String get baseUrl => getServerHost(env: env, mode: mode);

  static const String assetImagePrefixPath = "assets/images/";

  /// bugly相关
  static const buglyAndroidAppId = '0da7f235c9';
  static const buglyIosAppId = '9e3d92e673';

  /// 微信分享相关
  static const weChatAppId = 'wx1dda23b1cd57b8c2';
  static const weCharShareUniversalLink = 'https://ii1vy.share2dlink.com/';

  static bool get isDebug => mode == AppMode.debug;

  static bool get isPro => bool.fromEnvironment('dart.vm.product');

  static bool get isBEndApp => env == AppEnv.bEnd;

  static bool get isCEndApp => env == AppEnv.cEnd;

  static Future syncConfig() {
    return SharedPreferences.getInstance().then((SharedPreferences sp) {
      AppConfig.mode =
          (sp.getBool("isDebug") ?? true) ? AppMode.debug : AppMode.release;
      AppConfig.env =
          (sp.getBool("isBEnd") ?? true) ? AppEnv.bEnd : AppEnv.cEnd;
    });
  }

  static void setEnv({@required AppEnv appEnv, @required AppMode appMode}) {
    AppConfig.env = env;
    AppConfig.mode = mode;
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sp.setBool("isDebug", env == AppEnv.bEnd);
      sp.setBool("isBEnd", mode == AppMode.debug);
    });
  }
}
