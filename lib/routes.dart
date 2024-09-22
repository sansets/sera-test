import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/presentation/carts/cart_page.dart';
import 'package:sera_test/src/presentation/product_detail/product_detail_page.dart';
import 'package:sera_test/src/presentation/product_list/product_list_page.dart';
import 'package:sera_test/src/presentation/sign_in/sign_in_page.dart';
import 'package:sera_test/src/util/constants/demo_routes.dart';
import 'package:sera_test/src/util/global_variable.dart';

abstract class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: PathRoutes.signIn,
    routes: [
      GoRoute(
        path: PathRoutes.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: PathRoutes.productList,
        builder: (context, state) => const ProductListPage(),
        routes: [
          GoRoute(
            path: ProductDetailPage.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) {
              return ProductDetailPage(product: state.extra as ProductEntity?);
            },
          ),
          GoRoute(
            path: CartPage.routeName,
            parentNavigatorKey: rootNavigatorKey,
            builder: (context, state) => const CartPage(),
          ),
        ],
      ),
    ],
  );
}
