/*
 * @Description: 订单列表筛选
 * @Author: iamsmiling
 * @Date: 2021-01-05 14:07:46
 * @LastEditTime: 2021-01-19 13:52:47
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_list/order_list_controller.dart';
import 'package:taoju5/bapp/ui/widgets/common/button/x_check_button.dart';

class OrderFilterPage extends StatelessWidget {
  const OrderFilterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<OrderListParentController>(
            id: "time",
            builder: (_) {
              return GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 4,
                children: [
                  for (OrderTimeOptionModel e in _.timeList)
                    XCheckButton(
                        isChecked: e.isChecked,
                        onPresss: () => _.selectTime(e),
                        child: Text("${e.name}"))
                ],
              );
            },
          ),
          GetBuilder<OrderListParentController>(
            id: "status",
            builder: (_) {
              return GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 8),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 10,
                childAspectRatio: 4,
                children: [
                  for (OrderStatusTabModel tab in _.tabList)
                    XCheckButton(
                        isChecked: tab.isChecked,
                        onPresss: () => _.selectStatus(tab),
                        child: Text("${tab.name}(${tab.count})"))
                ],
              );
            },
          ),
          ElevatedButton(
              onPressed: Get.find<OrderListParentController>().refreshData,
              child: Text("确定"))
        ],
      ),
    );
  }
}
