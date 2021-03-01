import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/mainfest/order_mainfest_controller.dart';

class OrderMainfestPage extends GetView<OrderMainfestController> {
  const OrderMainfestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品清单"),
      ),
      body: Text(controller.toString()),
    );
  }
}
