/*
 * @Description: c端app
 * @Author: iamsmiling
 * @Date: 2021-02-02 22:39:50
 * @LastEditTime: 2021-02-03 10:25:19
 */

import 'package:get/get.dart';
import 'package:taoju5/bc-common/ui/pages/debug/debug_binding.dart';
import 'package:taoju5/bc-common/ui/pages/debug/debug_page.dart';
import 'package:taoju5/c-end-app/ui/pages/home/home_page.dart';

import 'capp_routes.dart';

class CAppPages {
  static final pages = [
    GetPage(
        name: CAppRoutes.home,
        page: () => CHomePage(),
        binding: DebugBinding()),
    GetPage(
        name: CAppRoutes.debug,
        page: () => DebugEnvPage(),
        binding: DebugBinding()),
  ];
}
