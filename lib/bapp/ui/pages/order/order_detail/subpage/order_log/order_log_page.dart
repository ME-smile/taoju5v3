import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/order/order_detail/subpage/order_log/order_log_controller.dart';

class OrderLogPage extends GetView<OrderLogController> {
  const OrderLogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("编辑记录"),
      ),
    );
  }
}
