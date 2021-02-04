/*
 * @Description: 分享弹窗
 * @Author: iamsmiling
 * @Date: 2021-01-15 15:27:15
 * @LastEditTime: 2021-02-02 10:58:30
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluwx/fluwx.dart';
import 'package:taoju5/b-end-app/domain/model/share/taojuwu_share_model.dart';
import 'package:taoju5/b-end-app/res/b_colors.dart';
import 'package:taoju5/b-end-app/res/b_dimens.dart';
import 'package:taoju5/b-end-app/ui/modal/base/x_base_modal.dart';
import 'package:taoju5/config/app_config.dart';

Future showShareModal(BuildContext context,
    {@required TaojuwuShareModel shareModel}) {
  void shareToWxSession() async {
    print("++_____分享到最近联系人");
    try {
      var result = shareToWeChat(shareModel.sessionShareModel);

      print(await result);
      print(result);
    } catch (err) {
      print("分享出错了");
      print(err);
    }
  }

  void shareToWeChatMoment() {
    shareToWeChat(shareModel.momentShareModel);
  }

  void copyLink() {
    Clipboard.setData(ClipboardData(text: shareModel.url));
    EasyLoading.showSuccess(shareModel.copyTip);
  }

  List<XShareModel> list = [
    XShareModel(
        description: "微信好友", icon: "wechat.png", onTap: shareToWxSession),
    XShareModel(
        description: "朋友圈",
        icon: "wechat_moment.png",
        onTap: shareToWeChatMoment),
    XShareModel(description: "复制链接", icon: "copy_link.png", onTap: copyLink),
  ];

  return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return XBaseModal(
            height: MediaQuery.of(context).size.height * .28,
            builder: (BuildContext context) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: BDimens.gap32,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: BDimens.gap32,
                          ),
                          child: Text(
                            "分享至",
                            style: TextStyle(
                                fontSize: BDimens.sp30,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Divider(),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: BDimens.gap32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (XShareModel e in list)
                                GestureDetector(
                                  onTap: e.onTap,
                                  behavior: HitTestBehavior.opaque,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          AppConfig.assetImagePrefixPath +
                                              e.icon),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: BDimens.gap16),
                                        child: Text(
                                          e.description,
                                          style: TextStyle(
                                              fontSize: BDimens.sp22,
                                              color:
                                                  BColors.descriptionTextColor),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: BDimens.gap16,
                    thickness: BDimens.gap16,
                  ),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "取消",
                        style: TextStyle(
                            fontSize: BDimens.sp30,
                            fontWeight: FontWeight.w400),
                      ))
                ],
              );
            });
      });
}
