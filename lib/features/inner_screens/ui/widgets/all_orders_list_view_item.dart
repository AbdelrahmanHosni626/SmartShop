import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';

class AllOrdersListViewItem extends StatelessWidget {

  final ProductModel product;
  const AllOrdersListViewItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        context.pushNamed(Routes.productDetails);
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
                            width: size.width * 0.5,
                            child: AppText(
                              text:
                              product.productTitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              IconlyLight.closeSquare,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                       AppText(text: 'Price: \$${product.productPrice}'),
                       AppText(text: 'Qty: ${product.productQuantity}'),
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
