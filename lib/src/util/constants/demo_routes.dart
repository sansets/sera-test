import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show BuildContext;
import 'package:go_router/go_router.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/presentation/carts/cart_page.dart';
import 'package:sera_test/src/presentation/product_detail/product_detail_page.dart';
import 'package:sera_test/src/presentation/product_list/product_list_page.dart';
import 'package:sera_test/src/presentation/sign_in/sign_in_page.dart';
import 'package:sera_test/src/util/global_variable.dart';

String joinRoutes(List<String> paths) {
  if (paths.isEmpty) {
    return '/';
  } else if (paths[0].startsWith('/')) {
    return paths.join('/');
  } else {
    return '/${paths.join('/')}';
  }
}

String dynamicRoutes(String nextRoutes) {
  final goRouter = locator<GoRouter>();
  Uri uri = goRouter.routerDelegate.currentConfiguration.uri;
  uri = uri.replace(
    path: joinRoutes([uri.path, nextRoutes]),
    queryParameters: {},
  );
  return uri.toString();
}

abstract final class PathRoutes {
  static String get signIn => joinRoutes([SignInPage.routeName]);
  static String get productList => joinRoutes([ProductListPage.routeName]);
  static String get productDetail => dynamicRoutes(ProductDetailPage.routeName);
  static String get cart => dynamicRoutes(CartPage.routeName);
}

extension GitsRoutesContextExtension on BuildContext {
  void goToSignIn() => go(PathRoutes.signIn);
  void goToProductList() => go(PathRoutes.productList);
  void goToProducDetail(ProductEntity product) =>
      go(PathRoutes.productDetail, extra: product);
  void goToCart() => go(PathRoutes.cart);
}
