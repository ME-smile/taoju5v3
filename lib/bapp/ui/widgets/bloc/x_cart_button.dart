/*
 * @Description: 购物车按钮
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:29:34
 * @LastEditTime: 2021-02-01 11:25:24
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/routes/bapp_pages.dart';
import 'package:taoju5/bapp/ui/pages/home/customer_provider_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class _XCartButtonController extends GetxController {
  jump() {
    CustomerProviderController customerProvider =
        Get.find<CustomerProviderController>();
    if (customerProvider.isCustomerNull) {
      return EasyLoading.showError("请先选择客户哦");
    }
    return Get.toNamed(BAppRoutes.cart + "/${customerProvider.id}");
  }
}

class XCartButton extends StatelessWidget {
  final String imageUrl;
  const XCartButton(
      {Key key, this.imageUrl = "assets/images/product_detail_cart.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<_XCartButtonController>(
        init: _XCartButtonController(),
        builder: (_) {
          return GestureDetector(onTap: _.jump, child: Image.asset(imageUrl));
        });
  }
}
