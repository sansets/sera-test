import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/domain/entities/rating_entity.dart';
import 'package:sera_test/src/presentation/product_list/bloc/products/products_bloc.dart';
import 'package:sera_test/src/presentation/product_list/cubit/product_list_cubit.dart';
import 'package:sera_test/src/presentation/product_list/item_product.dart';
import 'package:sera_test/src/theme/components/demo_app_bar.dart';
import 'package:sera_test/src/theme/demo_colors.dart';
import 'package:sera_test/src/util/base/base_state_page.dart';
import 'package:sera_test/src/util/constants/demo_routes.dart';
import 'package:sera_test/src/util/extensions/localization_extension.dart';
import 'package:sera_test/src/util/global_variable.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  static const routeName = 'product-list';

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage>
    with BaseStatePage<ProductListPage, ProductListCubit> {
  @override
  ProductListCubit setCubit() => locator();

  @override
  Widget buildWidget(BuildContext context) {
    final watchProductsState = context.watch<ProductsBloc>().state;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: DemoAppBar(
          title: context.s.appTitle,
          isHideBackButton: true,
          actions: [
            IconButton(
              onPressed: () {
                context.goToCart();
              },
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: context.color.iconPrimary,
              ),
            )
          ],
        ),
        body: watchProductsState is ProductsLoading
            ? _loadingWidget(context)
            : _contentWidget(context),
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    final products =
        context.select((ProductListCubit element) => element.state.products);

    return GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 228,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (_, index) {
          return ItemProduct(
            product: products[index],
            onTap: (product) {
              context.goToProducDetail(product);
            },
          );
        });
  }

  Widget _loadingWidget(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
          itemCount: 8,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 228,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (_, index) {
            return ItemProduct(
              product: const ProductEntity(
                id: "",
                title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
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
              onTap: (product) {},
            );
          }),
    );
  }
}
