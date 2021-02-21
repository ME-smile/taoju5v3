/*
 * @Description: 
 * @Author: iamsmiling
 * @Date: 2020-12-21 09:32:13
 * @LastEditTime: 2020-12-21 16:51:21
 */

import 'package:taoju5/bapp/domain/provider/taojuwu/taojuwu_api.dart';
import 'package:taoju5/xdio/x_dio.dart';

class TaojuwuRepository {
  TaojuwuAPI _api = TaojuwuAPI();

  Future<BaseResponse> curtainProductAttrs() {
    return _api.curtainProductAttrs("/api/goods/wcAttr");
  }
}
