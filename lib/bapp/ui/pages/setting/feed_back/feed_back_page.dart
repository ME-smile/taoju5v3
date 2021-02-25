/*
 * @Description: 问题反馈
 * @Author: iamsmiling
 * @Date: 2021-01-09 20:51:29
 * @LastEditTime: 2021-01-09 20:52:39
 */
import 'package:flutter/material.dart';
import 'package:taoju5/bapp/res/b_colors.dart';
import 'package:taoju5/bapp/res/b_dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/setting/feed_back/feed_back_controller.dart';

class FeedBackPage extends GetView<FeedBackController> {
  const FeedBackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("问题反馈"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Get.theme.primaryColor,
          padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
          child: Column(
            children: [
              Text("问题反馈"),
              Container(
                height: 196.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: BColors.inputBorderColor)),
                child: TextField(
                  decoration: InputDecoration(hintText: "请描述您的问题和意见，感谢支持"),
                ),
              ),
              Text("联系方式"),
              Container(
                height: 196.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: BColors.inputBorderColor)),
                child: TextField(
                  maxLines: 99,
                  decoration:
                      InputDecoration(hintText: "请留下您的手机号、微信或者邮箱，以便我们联系您"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
