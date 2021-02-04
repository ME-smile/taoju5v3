/*
 * @Description: 选择器的父类
 * @Author: iamsmiling
 * @Date: 2021-01-18 10:54:20
 * @LastEditTime: 2021-02-01 17:12:40
 */

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/domain/model/product/curtain_product_attr_model.dart';
import 'package:taoju5/b-end-app/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/fragment/product_attrs_selector/base/craft/craft_attr_selector_controller.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/fragment/product_attrs_selector/base/gauze/gauze_attr_selector_controller.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/fragment/product_attrs_selector/base/sectionalbar/sectionalbar_attr_selector_controller.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/product_detail_controller.dart';

abstract class BaseAttrSelectorController extends GetxController {
  TaojuwuController taojuwuController = Get.find<TaojuwuController>();

  CurtainProductAttrModel attr;

  String get value => attr?.currentOptionName;

  @mustCallSuper
  void select(
      CurtainProductAttrModel attr, CurtainProductAttrOptionModel option) {
    if (attr.isMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      for (CurtainProductAttrOptionModel o in attr.optionList) {
        o.isChecked = o.id == option.id;
      }
    }
    filter();
    update([tag]);
    print("+++++筛选后");
    print(craftController?.attr?.currentOptionName);
    print(sectionalbarController?.attr?.currentOptionName);
  }

  String get tag => Get.parameters["id"];
  CraftAttrSelectorController get craftController {
    if (Get.isRegistered<CraftAttrSelectorController>(tag: tag)) {
      return Get.find<CraftAttrSelectorController>(tag: tag);
    }
    return null;
  }

  SectionalbarAttrSelectorController get sectionalbarController {
    if (Get.isRegistered<SectionalbarAttrSelectorController>(tag: tag)) {
      return Get.find<SectionalbarAttrSelectorController>(tag: tag);
    }
    return null;
  }

  bool get hasGauze {
    if (Get.isRegistered<GauzeAttrSelectorController>(tag: tag)) {
      return Get.find<GauzeAttrSelectorController>(tag: tag).hasGauze;
    }
    return false;
  }

  bool get hasHole {
    return RegExp("打孔")
            .hasMatch(craftController?.attr?.currentOptionName ?? "") ??
        false;
  }

  bool get hasBox {
    return false;
  }

  ///过滤逻辑
  void filter() {
    _filterCraft();
    _filterSectionalbar();
  }

  ///筛选工艺
  void _filterCraft() {
    List<CurtainProductAttrOptionModel> list =
        taojuwuController?.craft?.optionList;

    ///作为容器存储
    List<CurtainProductAttrOptionModel> options = [];

    ///如果有盒
    if (hasBox) {
      for (CurtainProductAttrOptionModel option in list) {
        if (option.hasTrack) {
          options.add(option);
        }
      }
    } else {
      options = list;
    }

    ///如果不要需要窗纱
    if (!hasGauze) {
      ///不需要窗纱 过滤出单龙马杆
      options = options.where((e) => e.isSinglePole).toList();
    } else {
      ///需要窗纱过滤 双龙马杆
      options = options.where((e) => !e.isSinglePole).toList();
    }

    ///默认选中第一个
    for (int i = 0; i < options?.length; i++) {
      options[i].isChecked = i == 0;
    }

    ///更新型材选项
    craftController?.attr?.optionList = options;
    craftController?.update();
  }

  void _filterSectionalbar() {
    List<CurtainProductAttrOptionModel> list =
        taojuwuController?.sectionalbar?.optionList;

    ///作为容器存储
    List<CurtainProductAttrOptionModel> options = [];

    ///如果有盒
    if (hasBox) {
      for (CurtainProductAttrOptionModel option in list) {
        if (option.hasTrack) {
          options.add(option);
        }
      }
    } else {
      options = list;
    }

    //如果需要打孔
    if (hasHole) {
      ///过滤出龙马杆
      options = options.where((e) => e.isDragonHorsePole).toList();
    } else {
      options = options.where((e) => !e.isDragonHorsePole).toList();
    }

    ///默认选中第一个
    for (int i = 0; i < options?.length; i++) {
      options[i].isChecked = i == 0;
    }

    sectionalbarController?.attr?.optionList = options;
    sectionalbarController?.update();
  }

  Future<bool> reset() {
    if (GetUtils.isNullOrBlank(attr?.confirmSelectedOptionList)) {
      attr?.optionList?.first?.isChecked = true;
      attr?.optionList?.first?.hasConfirmed = true;
    }
    attr?.optionList?.forEach((e) {
      e.isChecked = e.isChecked && e.hasConfirmed;
    });

    update(["options"]);
    Get.back();
    return Future.value(true);
  }

  void confirm() {
    attr?.currentSelectedOptionList?.forEach((e) {
      e.hasConfirmed = true;
      update(["value"]);
    });
    print(
        Get.find<ProductDetailController>(tag: tag).priceDelegator?.totalPrice);
    Get.find<ProductDetailController>(tag: tag).updateTotalPrice();
    Get.back();
  }
}
