/*
 * @Description: 搜索页面
 * @Author: iamsmiling
 * @Date: 2021-01-07 14:25:23
 * @LastEditTime: 2021-02-02 14:33:35
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animations/animations.dart';
import 'package:taoju5/b-end-app/res/b_colors.dart';
import 'package:taoju5/b-end-app/res/b_dimens.dart';
import 'package:taoju5/b-end-app/res/b_icons.dart';
import 'package:taoju5/b-end-app/ui/dialog/search/clear_search_history.dart';
import 'package:taoju5/b-end-app/ui/pages/search/search_controller.dart';
import 'package:taoju5/b-end-app/ui/widgets/common/x_search_bar.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BColors.primaryColor,
        appBar: XSearchBar(
          onSearch: controller.addSearchItem,
          hintText: controller.hintText,
          preferredSize: Size.fromHeight(kToolbarHeight),
        ),
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: GetBuilder<SearchController>(
            id: "history",
            builder: (_) {
              return Visibility(
                visible: !GetUtils.isNullOrBlank(_.historyList),
                child: Container(
                  color: BColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: BDimens.gap16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "搜索记录:",
                            style: TextStyle(
                                fontSize: BDimens.sp30,
                                fontWeight: FontWeight.w500),
                          ),
                          IconButton(
                              icon: Icon(BIcons.del),
                              onPressed: showClearSearchHistoryDialog)
                        ],
                      ),
                      Wrap(
                        children: [
                          for (String e in _.historyList)
                            Container(
                              margin: EdgeInsets.only(right: BDimens.gap16),
                              child: Chip(
                                  deleteIconColor: BColors.greyTextColor,
                                  backgroundColor: BColors.scaffoldBgColor,
                                  label: Text(e),
                                  onDeleted: () {
                                    controller.removeSearchItem(e);
                                  }),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
