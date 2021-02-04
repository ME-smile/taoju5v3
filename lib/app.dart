/*
 * @Description: app
 * @Author: iamsmiling
 * @Date: 2021-02-03 10:26:46
 * @LastEditTime: 2021-02-03 10:29:34
 */
import 'package:flutter/material.dart';

import 'b-end-app/app.dart';
import 'c-end-app/app.dart';
import 'config/app_config.dart';

class TaojuwuApp extends StatelessWidget {
  const TaojuwuApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AppConfig.isBEndApp ? BEndApp() : CEndAPP(),
    );
  }
}
