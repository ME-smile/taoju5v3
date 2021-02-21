/*
 * @Description: 商品列表
 * @Author: iamsmiling
 * @Date: 2020-12-21 10:28:50
 * @LastEditTime: 2021-01-25 09:44:56
 */
import 'package:taoju5/bapp/domain/model/product/cart_product_model.dart';
import 'package:taoju5/bapp/domain/model/product/design_product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_detail_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_filter_tag_model.dart';
import 'package:taoju5/bapp/domain/model/product/product_model.dart';
import 'package:taoju5/bapp/domain/provider/product/product_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class ProductRepository {
  final ProductAPI _api = ProductAPI();

  Future<ProductModelListWrapper> productList({Map params}) {
    return _api
        .productList("/api/goods/goodsListByConditions", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return ProductModelListWrapper.fromJson(response.data);
      }
      throw Exception(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<ProductDetailModelWrapper> productDetail({Map params}) => _api
          .productDetail("/api/goods/goodsDetail", params: params)
          .then((BaseResponse response) {
        if (response.isValid) {
          return ProductDetailModelWrapper.fromJson(response.data);
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });
  Future<ProductDetailModelWrapper> productWebDetail({Map params}) => _api
          .productDetail("/api/goods/goodsDetailForWeb", params: params)
          .then((BaseResponse response) {
        if (response.isValid) {
          return ProductDetailModelWrapper.fromJson(response.data);
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });
  Future<BaseResponse> productShare({Map params}) => _api
          .productDetail("/api/goods/goodsShare", params: params)
          .then((BaseResponse response) async {
        if (response.isValid) {
          return response;
        }
        throw Exception(response.message);
      }).catchError((err) {
        throw err;
      });

  Future<CartPorductModelListWrapper> cartList({Map params}) {
    return _api
        .cartList("/api/goods/cartList", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return CartPorductModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  Future<ProductFilterTagModelListWrapper> filterTag({Map params}) {
    return _api
        .cartList("/api/goods/filtrateTag", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return ProductFilterTagModelListWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  //// {'scenes_id': widget.scenesId
  Future<DesignProductDetailModelWrapper> sceneDesignProductDetail(
      {Map params}) {
    return _api
        .cartList("/api/goods/scenesDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return DesignProductDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  //// {'scenes_id': widget.scenesId
  Future<DesignProductDetailModelWrapper> softDesignProductDetail(
      {Map params}) {
    return _api
        .cartList("/api/goods/scenesDetail", params: params)
        .then((BaseResponse response) {
      if (response.isValid) {
        return DesignProductDetailModelWrapper.fromJson(response.data);
      }
      throw Future.error(response.message);
    }).catchError((err) {
      throw err;
    });
  }

  ///加入购物车

}
