import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_heart_icon.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/cart/ui/widgets/quantity_bottom_sheet.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';

class ShoppingBasketListViewItem extends StatelessWidget {
  final ProductModel product;
  const ShoppingBasketListViewItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        context.pushNamed(Routes.productDetails, arguments: product);
      },
      child: FittedBox(
        child: IntrinsicWidth(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: FancyShimmerImage(
                    imageUrl:
                    product.productImage,
                    height: size.height * 0.2.h,
                    width: size.width * 0.3.w,
                  ),
                ),
                horizontalSpace(10),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.6,
                            child: AppText(
                              text:
                              product.productTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              const AppHeartIconButton(fgColor: Colors.red, bgColor:  Colors.transparent,),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppText(text: '\$${product.productPrice}'),
                          const Spacer(),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return const QuantityBottomSheet();
                                },
                              );
                            },
                            icon: const Icon(IconlyLight.arrowDown2),
                            label: Text(product.productQuantity),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
