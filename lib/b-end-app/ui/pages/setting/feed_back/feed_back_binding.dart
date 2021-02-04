/*
 * @Description: 问题反馈
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:54:03
 * @LastEditTime: 2021-01-09 20:55:26
 */
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/ui/pages/setting/feed_back/feed_back_controller.dart';

class FeedBackBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FeedBackController());
  }
}
