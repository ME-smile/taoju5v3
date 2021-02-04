/*
 * @Description: 打开方式安装昂视逻辑处理
 * @Author: iamsmiling
 * @Date: 2021-01-19 10:30:21
 * @LastEditTime: 2021-02-01 15:41:38
 */
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/domain/model/window/window_style_model.dart';
import 'package:taoju5/b-end-app/ui/pages/home/taojuwu_controller.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/fragment/product_attrs_selector/base/window_pattern/window_pattern_selector_controller.dart';

class WindowStyleSelectorController extends GetxController {
  final String tag;

  WindowStyleSelectorController({@required this.tag});
  TaojuwuController get taojuwuController => Get.find<TaojuwuController>();

  WindowPatternSelectorController get windowPatternSelectorController =>
      Get.find<WindowPatternSelectorController>(tag: tag);
  WindowStyleOptionModel get style {
    List<WindowStyleOptionModel> list = taojuwuController.style.styleList;
    for (int i = 0; i < list.length; i++) {
      WindowStyleOptionModel e = list[i];
      if (RegExp(windowPatternSelectorController.value).hasMatch(e.name))
        return e;
    }
    return GetUtils.isNullOrBlank(list) ? null : list?.first;
  }

  List<WindowInstallModeOptionModel> get installModeOptionList {
    if (style == null) return null;
    return style.installModeOptionList;
  }

  WindowInstallModeOptionModel get currentInstallModeOption {
    if (GetUtils.isNullOrBlank(installModeOptionList)) return null;
    return installModeOptionList?.firstWhere((e) => e.isChecked,
        orElse: () => null);
  }

  List<WindowOpenModeOptionModel> get openModeOptionList {
    if (style == null) return null;
    return style.openModeOptionList;
  }

  WindowOpenModeOptionModel get currentOpenModeOption =>
      openModeOptionList?.firstWhere((e) => e.isChecked, orElse: () => null);

  List<WindowSubopenModeModel> get subopenModeList {
    if (GetUtils.isNullOrBlank(openModeOptionList)) return [];
    return currentOpenModeOption?.suboptionList;
  }

  ///顶部主图
  String get mainImg {
    return currentInstallModeOption?.img ?? 'curtain/size_0100-1-1-SPW-H.png';
  }

  void selectInstallMode(
      {@required WindowInstallModeOptionModel option,
      bool canMultiple = false}) {
    if (canMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      installModeOptionList?.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  void selectOpenMode(
      {@required WindowOpenModeOptionModel option, bool canMultiple = false}) {
    if (canMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      openModeOptionList?.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  void selectSubopenMode(
      {@required WindowSubopenModeModel mode,
      @required WindowSubopenModeOptionModel option,
      bool canMultiple = false}) {
    if (canMultiple) {
      option.isChecked = !option.isChecked;
    } else {
      mode.optionList.forEach((e) {
        e.isChecked = e == option;
      });
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void confirm() {
    currentInstallModeOption.isConfirmed = true;
    currentOpenModeOption.isConfirmed = true;
    subopenModeList?.forEach((e) {
      e.optionList?.forEach((element) {
        element.isConfirmed = element.isChecked;
      });
    });
  }
}
