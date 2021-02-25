import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/logistics/order_logistics_controller.dart';
import 'package:taoju5/bapp/ui/widgets/base/x_loadstate_builder.dart';

import 'widget/packet_logistics_card.dart';

class OrderLogisticsPage extends StatelessWidget {
  const OrderLogisticsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.theme.primaryColor,
        appBar: AppBar(
          title: Text("订单跟踪"),
        ),
        body: GetBuilder<OrderLogisticsController>(
          builder: (_) {
            return XLoadStateBuilder(
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Container(
                      width: Get.width,
                      child: Text(
                        "订单分包裹邮寄，其中2个已寄出",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemCount: _.logistics.packetList.length,
                            separatorBuilder: (BuildContext context, int i) {
                              return Divider();
                            },
                            itemBuilder: (BuildContext context, int i) {
                              return PacketLogisticsCard(
                                packet: _.logistics.packetList[i],
                              );
                            }))
                  ],
                );
              },
              loadState: _.loadState,
              retry: _.loadData,
            );
          },
        ));
  }
}
