import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/bapp/domain/repository/product/product_repository.dart';

class XLikeController extends GetxController {
  ProductRepository _repository = ProductRepository();

  String deactiveIcon = "assets/images/blank_heart.png";

  String activeIcon = "assets/images/filled_heart";

  bool isActive = false;

  String get icon => isActive ? activeIcon : deactiveIcon;

  Future _loadData() {
    return _repository.isLiked();
  }

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }
}

class XLikeButton extends StatelessWidget {
  const XLikeButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<XLikeController>(
      init: XLikeController(),
      builder: (_) {
        return Image.asset(_.icon);
      },
    );
  }
}
