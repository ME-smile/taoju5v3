import 'package:flutter/material.dart';
import 'package:taoju5/bapp/ui/pages/product/cart/subpage/modify_curtain_product_attr/modify_curtain_product_attr_controller.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/accessory/accessory_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_bar.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/riboux/riboux_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/fragment/product_attrs_selector/base/valance/valance_attr_selector_bar.dart';
import 'package:taoju5/bapp/ui/pages/product/product_detail/widgets/sectionalbar_attr_selector_bar.dart';

///修改窗帘属性的页面
class ModifyCurtainProductAttrPage
    extends GetView<ModifyCurtainProductAttrController> {
  const ModifyCurtainProductAttrPage({Key key}) : super(key: key);
  String get tag => controller.tag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("修改属性"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GauzeAttrSelectorBar(tag: tag),
            ValanceAttrSelectorBar(tag: tag),
            RibouxAttrSelectorBar(tag: tag),
            AccessoryAttrSelectorBar(tag: tag)
          ],
        ),
      ),
    );
  }
}
