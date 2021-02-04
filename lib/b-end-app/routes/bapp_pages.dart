/*
 * @Description: app页面
 * @Author: iamsmiling
 * @Date: 2020-12-18 16:11:26
 * @LastEditTime: 2021-02-03 10:25:39
 */

import 'package:get/get.dart';
import 'package:taoju5/b-end-app/storage/storage_manager.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_address_edit/customer_address_edit_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_address_edit/customer_address_eidt_page.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_detail/customer_detail_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_detail/customer_detail_page.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_edit/customer_edit_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_edit/customer_edit_page.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_list/customer_list_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/customer/customer_list/customer_list_page.dart';
import 'package:taoju5/b-end-app/ui/pages/dashboard/data_dash_board_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/dashboard/data_dash_board_page.dart';
import 'package:taoju5/b-end-app/ui/pages/home/home_page.dart';
import 'package:taoju5/b-end-app/ui/pages/login/login/login_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/login/login/login_page.dart';
import 'package:taoju5/b-end-app/ui/pages/not_found_404/not_found_404_page.dart';
import 'package:taoju5/b-end-app/ui/pages/order/commit_order/commit_order_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/order/commit_order/commit_order_page.dart';
import 'package:taoju5/b-end-app/ui/pages/order/commit_order_success/commit_order_success_page.dart';
import 'package:taoju5/b-end-app/ui/pages/order/order_detail/order_detail_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/order/order_detail/order_detail_page.dart';
import 'package:taoju5/b-end-app/ui/pages/order/order_list/order_list_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/order/order_list/order_list_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/cart/cart_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/cart/cart_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/collection/collection_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/collection/collection_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/product_detail_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/design_product/scene_product_detail/scene_product_detail_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/design_product/soft_prodcut_detail/soft_product_detail_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/measure_data/edit_measure_data_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/product_share/product_share_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/subpage/product_share/product_share_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_detail/product_detail_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_list/product_list_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/product_list/product_list_page.dart';
import 'package:taoju5/b-end-app/ui/pages/product/selectable_product_list/selectable_product_list_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/product/selectable_product_list/selectable_product_list_page.dart';
import 'package:taoju5/b-end-app/ui/pages/search/search_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/search/search_page.dart';
import 'package:taoju5/b-end-app/ui/pages/setting/app_version/app_version_page.dart';
import 'package:taoju5/b-end-app/ui/pages/setting/feed_back/feed_back_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/setting/feed_back/feed_back_page.dart';
import 'package:taoju5/b-end-app/ui/pages/setting/setting/setting_binding.dart';
import 'package:taoju5/b-end-app/ui/pages/setting/setting/setting_page.dart';
import 'package:taoju5/b-end-app/ui/pages/user_protocol/user_protocol_page.dart';
import 'package:taoju5/bc-common/ui/pages/debug/debug_binding.dart';
import 'package:taoju5/bc-common/ui/pages/debug/debug_page.dart';

part 'bapp_routes.dart';

class BAppPages {
  static get initial => GetUtils.isNullOrBlank(
          StorageManager().sharedPreferences?.getString("token"))
      ? BAppRoutes.home
      : BAppRoutes.home;

  static final unknownRoute =
      GetPage(name: BAppRoutes.unknownRoute, page: () => NotFound404Page());

  static final pages = [
    GetPage(
      name: BAppRoutes.home,
      page: () => HomePage(),
    ),

    GetPage(
        name: BAppRoutes.debug,
        page: () => DebugEnvPage(),
        binding: DebugBinding()),

    GetPage(
        name: BAppRoutes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),

    ///商品相关
    GetPage(
        name: BAppRoutes.productList,
        page: () => ProductListPage(),
        binding: ProductListBinding()),
    GetPage(
      name: BAppRoutes.productDetail + "/:id",
      page: () => ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

    GetPage(
        name: BAppRoutes.productShare + "/:id/:token",
        page: () => ProductSharePage(),
        binding: ProductShareBinding()),

    GetPage(
        name: BAppRoutes.selectableProductList,
        page: () => SelectableProductListPage(),
        binding: SelectableProductListBinding()),

    ///场景
    GetPage(
        name: BAppRoutes.sceneProductDetail + "/:id",
        page: () => SceneProductDetailPage(),
        binding: SceneProductDetailBinding()),

    ///软装方案
    GetPage(
        name: BAppRoutes.softProductDetail + "/:id",
        page: () => SoftProductDetailPage(),
        binding: SoftProductDetailBinding()),

    ///购物车页面
    GetPage(
        name: BAppRoutes.cart, page: () => CartPage(), binding: CartBinding()),

    ///填写测装数据
    GetPage(
      name: BAppRoutes.editMeasureData + "/:id",
      page: () => EditMeasureDataPage(),
    ),

    ///客户相关
    GetPage(
        name: BAppRoutes.customerList,
        page: () => CustomerListPage(),
        binding: CustomerListBinding()),
    GetPage(
        name: BAppRoutes.customerDetail + "/:id",
        page: () => CustomerDetailPage(),
        binding: CustomerDetailBinding()),
    GetPage(
        name: BAppRoutes.customerEdit + "/:canChoose",
        page: () => CustomerEditPage(),
        binding: CustomerEditBinding()),

    ///订单相关
    GetPage(
        name: BAppRoutes.orderList + "/:customerId",
        page: () => OrderListPage(),
        binding: OrderListBinding()),

    GetPage(
        name: BAppRoutes.orderDetail + "/:id",
        page: () => OrderDetailPage(),
        binding: OrderDetailBinding()),

    GetPage(
        name: BAppRoutes.commitOrder + "/:orderType",
        page: () => CommitOrderPage(),
        binding: CommitOrderBinding()),
    GetPage(
        name: BAppRoutes.commitOrderSuccess,
        page: () => CommitOrderSuccessPage()),

    GetPage(
        name: BAppRoutes.customerAddressEdit + "/:id",
        page: () => CustomerAddressEditPage(),
        binding: CustomerAddressEditBinding()),

    ///设置相关
    GetPage(
        name: BAppRoutes.setting,
        page: () => SettingPage(),
        binding: SettngBinding()),
    GetPage(
        name: BAppRoutes.feedback,
        page: () => FeedBackPage(),
        binding: FeedBackBinding()),

    ///数据中心
    GetPage(
        name: BAppRoutes.dashBoard,
        page: () => DataDashBoardPage(),
        binding: DataDashBoardBinding()),

    ///搜索页面
    GetPage(
        name: BAppRoutes.search,
        page: () => SearchPage(),
        binding: SeacrhBinding()),

    ///搜藏夹
    GetPage(
        name: BAppRoutes.collection,
        page: () => CollectionPage(),
        binding: CollectionBinding()),

    ///用户协议
    GetPage(name: BAppRoutes.userProtocol, page: () => UserProtocolPage()),

    ///app版本号
    GetPage(name: BAppRoutes.appVersion, page: () => AppVersionPage())
  ];
}
