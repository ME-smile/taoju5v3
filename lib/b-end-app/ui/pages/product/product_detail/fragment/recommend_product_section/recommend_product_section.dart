/*
 * @Description: 为你推荐
 * @Author: iamsmiling
 * @Date: 2021-01-08 17:27:57
 * @LastEditTime: 2021-02-02 10:31:06
 */

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/domain/model/product/product_model.dart';
import 'package:taoju5/b-end-app/res/b_dimens.dart';
import 'package:taoju5/b-end-app/routes/bapp_pages.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/widgets/x_title_bar.dart';

class RecommendProductSection extends StatelessWidget {
  final List<ProductModel> productList;

  const RecommendProductSection({Key key, this.productList = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !GetUtils.isNullOrBlank(productList),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          XTitleBar(title: "为你推荐"),
          Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: productList.length,
                  physics: NeverScrollableScrollPhysics(),
                  // controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.84,
                  ),
                  itemBuilder: (BuildContext context, int i) {
                    ProductModel e = productList[i];
                    return GestureDetector(
                      onTap: () => Get.toNamed(
                          BAppRoutes.productDetail + "/${e.id}",
                          arguments: e.productType),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 320.w,
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Image.network(e.image)),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                  left: BDimens.gap20, top: BDimens.gap24),
                              child: Row(
                                children: [
                                  Text(
                                    e.name,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: BDimens.gap20, top: BDimens.gap12),
                              alignment: Alignment.centerLeft,
                              child: Text("¥${e.price.toStringAsFixed(2)}"),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
