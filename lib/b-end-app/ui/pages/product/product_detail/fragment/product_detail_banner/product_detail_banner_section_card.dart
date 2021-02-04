/*
 * @Description: 顶部图片
 * @Author: iamsmiling
 * @Date: 2020-12-23 17:14:27
 * @LastEditTime: 2021-01-25 09:45:40
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/ui/widgets/bloc/x_swiper.dart';
import 'package:taoju5/b-end-app/ui/widgets/common/x_photo_viewer.dart';

class ProductDetailBannerCard extends StatelessWidget {
  final List<String> imageList;
  const ProductDetailBannerCard({Key key, @required this.imageList})
      : super(key: key);

  String get tag => Get.parameters["id"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 80),
      child: XSwiper(
        itemCount: imageList?.length,
        itemBuilder: (BuildContext context, int index) {
          return XPhotoViewer(url: imageList[index]);
        },
      ),
    );
  }
}
