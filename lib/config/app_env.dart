/*
 * @Description: app环境
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:32:32
 * @LastEditTime: 2021-02-03 10:04:00
 */
enum AppEnv { bEnd, cEnd }
enum AppMode { release, debug }
String getAppName({AppEnv env = AppEnv.bEnd, AppMode mode = AppMode.debug}) {
  if (env == AppEnv.bEnd) {
    return mode == AppMode.debug ? "淘居屋商家测试版" : "淘居屋商家";
  }
  return mode == AppMode.debug ? "淘居屋C端测试版" : "淘居屋C端";
}

String getServerHost({AppEnv env = AppEnv.bEnd, AppMode mode = AppMode.debug}) {
  if (env == AppEnv.bEnd) {
    return mode == AppMode.debug
        ? "http://buyi.taoju5.com"
        : "http://www.taoju5.com";
  }
  return mode == AppMode.debug
      ? "http://www.baidu.com"
      : "http://www.apple.com";
}
