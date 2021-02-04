/*
 * @Description: 物流
 * @Author: iamsmiling
 * @Date: 2021-01-06 14:06:56
 * @LastEditTime: 2021-01-10 20:34:33
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/res/b_colors.dart';
import 'package:taoju5/b-end-app/res/b_dimens.dart';
import 'package:taoju5/b-end-app/res/b_icons.dart';
import 'package:taoju5/b-end-app/ui/pages/order/order_detail/order_detail_controller.dart';

class OrderLogisticsCard extends GetView<OrderDetailController> {
  const OrderLogisticsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: BDimens.gap36, horizontal: BDimens.gap32),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: BDimens.gap24),
            child: Icon(
              BIcons.add,
              color: BColors.foregroundColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "收货人:${controller.order.receiverName}  ${controller.order.receiverTel}",
                style: TextStyle(
                    color: BColors.textColor,
                    fontSize: BDimens.sp28,
                    fontWeight: FontWeight.w400),
              ),
              Padding(
                padding: EdgeInsets.only(top: BDimens.gap4),
                child: Text("${controller.order.receiverAddress}",
                    style: TextStyle(
                        fontSize: BDimens.sp24, color: BColors.subTitleColor)),
              ),
            ],
          )
        ],
      ),
    );
  }
}