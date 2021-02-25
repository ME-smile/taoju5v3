### 如果需要打包不同环境,只需要修改app_config文件
```
 // app名字
  // static String get appName => isDebug ? '淘居屋商家测试版' : "淘居屋商家";
  static AppEnv env = AppEnv.$b;
  ///打包时只需要修改这两个即可
  static AppMode mode = AppMode.debug;
```
