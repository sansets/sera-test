import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/domain/entities/cart_product_entity.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/entities/rating_entity.dart';
import 'package:sera_test/src/presentation/carts/bloc/cart/cart_bloc.dart';
import 'package:sera_test/src/presentation/carts/cubit/cart_cubit.dart';
import 'package:sera_test/src/presentation/carts/item_cart_product.dart';
import 'package:sera_test/src/theme/components/demo_app_bar.dart';
import 'package:sera_test/src/util/base/base_state_page.dart';
import 'package:sera_test/src/util/extensions/localization_extension.dart';
import 'package:sera_test/src/util/global_variable.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  static const routeName = 'cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with BaseStatePage<CartPage, CartCubit> {
  @override
  CartCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    final watchCartState = context.watch<CartBloc>().state;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: DemoAppBar(
          title: context.s.titleShoppingCart,
        ),
        body: watchCartState is CartLoading
            ? _loadingWidget(context)
            : _contentWidget(context),
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    final products = context
            .select((CartCubit element) => element.state.cart?.cartProducts) ??
        [];

    return ListView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (context, index) => ItemCartProduct(
        cart: products[index],
        onTap: (product) {},
      ),
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
          itemCount: 8,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            return ItemCartProduct(
              cart: const CartProductEntity(
                product: ProductEntity(
                  id: "",
                  title:
                      "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                  price: 109.95,
                  category: "",
                  description: "",
                  image:
                      "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
                  rating: RatingEntity(
                    rate: 3.9,
                    count: 120,
                  ),
                ),
                quantity: "2",
              ),
              onTap: (product) {},
            );
          }),
    );
  }
}
