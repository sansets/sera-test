import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sera_test/src/domain/entities/cart_product_entity.dart';
import 'package:sera_test/src/theme/components/demo_snackbar.dart';
import 'package:sera_test/src/theme/demo_colors.dart';
import 'package:sera_test/src/util/extensions/snackbar_extension.dart';

class ItemCartProduct extends StatelessWidget {
  const ItemCartProduct({
    super.key,
    required this.cart,
    required this.onTap,
  });

  final CartProductEntity? cart;
  final ValueChanged<CartProductEntity?> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onTap.call(cart);
        },
        borderRadius: BorderRadius.circular(8),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: cart?.product?.image.toString() ?? "",
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        cart?.product?.title.toString() ?? "",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: context.color.textPrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "USD ${cart?.product?.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: context.color.textPrimary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        children: [
                          _quantityActionButton(
                            context: context,
                            icon: Icons.remove,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          Text(
                            cart?.quantity.toString() ?? "",
                            style: TextStyle(
                              color: context.color.textPrimary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _quantityActionButton(
                            context: context,
                            icon: Icons.add,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quantityActionButton({
    required BuildContext context,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: () {
        context.showSnackBar(DemoSnackBar.info(message: "Coming soon."));
        onTap.call();
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.color.strokeSecondary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: context.color.iconPrimary,
          size: 16,
        ),
      ),
    );
  }
}
