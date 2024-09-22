import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sera_test/src/domain/entities/product_entity.dart';
import 'package:sera_test/src/presentation/product_detail/cubit/product_detail_cubit.dart';
import 'package:sera_test/src/theme/assets/demo_icons.dart';
import 'package:sera_test/src/theme/components/demo_app_bar.dart';
import 'package:sera_test/src/theme/components/demo_button/demo_button.dart';
import 'package:sera_test/src/theme/components/demo_snackbar.dart';
import 'package:sera_test/src/theme/demo_colors.dart';
import 'package:sera_test/src/util/base/base_state_page.dart';
import 'package:sera_test/src/util/extensions/localization_extension.dart';
import 'package:sera_test/src/util/extensions/snackbar_extension.dart';
import 'package:sera_test/src/util/global_variable.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    super.key,
    this.product,
  });

  static const routeName = 'product-detail';

  final ProductEntity? product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with BaseStatePage<ProductDetailPage, ProductDetailCubit> {
  @override
  ProductDetailCubit setCubit() => locator()..initData(widget.product);

  @override
  Widget buildWidget(BuildContext context) {
    final product =
        context.select((ProductDetailCubit element) => element.state.product);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: const DemoAppBar(
          title: "",
        ),
        body: _contentWidget(context, product),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: DemoButton.primary(
            text: context.s.titleAddToCart,
            onPressed: () {
              context.showSnackBar(DemoSnackBar.info(message: "Coming soon."));
            },
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(BuildContext context, ProductEntity? product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          CachedNetworkImage(
            height: 256,
            imageUrl: product?.image.toString() ?? "",
          ),
          const SizedBox(height: 24),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              "USD ${product?.price}",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: context.color.primary,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              product?.title.toString() ?? "",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: context.color.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset(
                  DemoIcons.icStar,
                  width: 12,
                  height: 12,
                  colorFilter: const ColorFilter.mode(
                    Colors.orange,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  "${product?.rating?.rate} • ${product?.rating?.count} reviews",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.color.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              product?.description.toString() ?? "",
            ),
          ),
        ],
      ),
    );
  }
}
