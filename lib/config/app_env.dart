/*
 * @Description: app环境
 * @Author: iamsmiling
 * @Date: 2021-02-02 17:32:32
 * @LastEditTime: 2021-02-04 15:01:34
 */
enum AppEnv { bEnd, cEnd }
enum AppMode { release, debug }
String getAppName({AppEnv env = AppEnv.bEnd, AppMode mode = AppMode.debug}) {
  Map<String, String> map = {
    {AppEnv.bEnd, AppMode.debug}.toString(): "淘居屋商家测试版",
    {AppEnv.bEnd, AppMode.release}.toString(): "淘居屋商家",
    {AppEnv.cEnd, AppMode.debug}.toString(): "淘居屋测试版",
    {AppEnv.cEnd, AppMode.release}.toString(): "淘居屋",
  };
  return map[{env, mode}.toString()];
}

String getServerHost({AppEnv env = AppEnv.bEnd, AppMode mode = AppMode.debug}) {
  Map<String, String> map = {
    {AppEnv.bEnd, AppMode.debug}.toString(): "http://buyi.taoju5.com",
    {AppEnv.bEnd, AppMode.release}.toString(): "http://www.taoju5.com",
    {AppEnv.cEnd, AppMode.debug}.toString(): "http://www.baidu.com",
    {AppEnv.cEnd, AppMode.release}.toString(): "http://www.apple.com",
  };
  return map[{env, mode}.toString()];
}
