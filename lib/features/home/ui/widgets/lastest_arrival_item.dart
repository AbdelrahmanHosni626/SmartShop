import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_heart_icon.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_cubit.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';

class LastArrivalItem extends StatelessWidget {
  final ProductModel product;
  const LastArrivalItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var cubit = BottomNavCubit.get(context);
    return GestureDetector(
      onTap: ()
      {
        cubit.findByProdId(id: product.productId);
        context.pushNamed(Routes.productDetails, arguments: product);
      },
      child: SizedBox(
        width:  size.width * 0.5.w,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              child: FancyShimmerImage(
                width: size.width * 0.2.w,
                height: size.height * 0.18.h,
                imageUrl: product.productImage,
              ),
            ),
            horizontalSpace(10),
            Flexible(
              child: Column(
                children: [
                  AppText(
                    text: product.productTitle,
                    fontSize: 18.sp,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_shopping_cart_rounded),
                        ),
                        const AppHeartIconButton(bgColor: Colors.transparent,),
                      ],
                    ),
                  ),
                  AppText(
                    text: '\$${product.productPrice}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
