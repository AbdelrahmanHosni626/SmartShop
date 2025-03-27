import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_heart_icon.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_cubit.dart';

import '../../../home/data/models/product_model.dart';

class SearchGridViewBuilderItem extends StatelessWidget {


  final ProductModel product;
  const SearchGridViewBuilderItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    var cubit = BottomNavCubit.get(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ()
      {
        cubit.findByProdId(id: product.productId);
        context.pushNamed(Routes.productDetails, arguments: product);
      },
      child: Padding(
        padding: EdgeInsets.all(3.r),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30.r)),
              child: FancyShimmerImage(
                imageUrl: product.productImage,
                height: size.height * 0.25.h,
                width: double.infinity,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: AppText(
                    text: product.productTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Flexible(
                  child: AppHeartIconButton(bgColor: Colors.transparent,),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: AppText(
                    text: '\$${product.productPrice}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
