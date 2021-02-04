/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-29 11:43:32
 * @LastEditTime: 2021-02-02 09:34:58
 */
import 'package:get/get.dart';
import 'package:taoju5/b-end-app/domain/model/customer/customer_detail_model.dart';
import 'package:taoju5/b-end-app/domain/model/customer/customer_model.dart';

class CustomerProviderController extends GetxController {
  CustomerDetailModel _customer;

  bool get isCustomerNull => _customer == null;
  String get abbrName {
    if (_customer == null || _customer?.name == null) return "请选择";
    if (_customer.name.length > 12) {
      return _customer.name.substring(0, 8) +
          "..." +
          _customer.name.substring(8, 11);
    }
    return _customer.name;
  }

  String get name =>
      GetUtils.isNullOrBlank(_customer?.name) ? "请选择" : _customer?.name;

  String get id => _customer?.id;
  CustomerDetailModel get customer => _customer;

  set customer(CustomerDetailModel model) {
    _customer = model;
    print("");
  }

  setCustomer(CustomerModel model) {
    _customer ??= CustomerDetailModel();
    _customer.id = model.id;
    _customer.name = model.name;
    update();
  }

  clear() {
    _customer = null;
    update();
  }

  void updateCartCount(int count) {
    _customer.cartCount = count;
    update(["count"]);
  }
}
