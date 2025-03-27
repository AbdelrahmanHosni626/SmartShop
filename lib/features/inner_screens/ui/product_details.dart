import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_bar_leading.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';
import 'package:smartshop/features/profile/ui/widgets/app_bar_title.dart';

import '../../../core/widgets/app_heart_icon.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const AppBarTitle(title: 'SmartShop', fontSize: 25),
        centerTitle: true,
        actions: [
          Badge(
            label: const Text('10'),
            alignment: Alignment.topLeft,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: ()
              {
                context.pushNamed(Routes.bottomNavigationBarScreen[2]);
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                child: FancyShimmerImage(
                  imageUrl: product.productImage,
                  width: double.infinity,
                  boxFit: BoxFit.fill,
                ),
              ),
              verticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7.w,
                    child: Flexible(
                      child: AppText(
                        text: product.productTitle,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  AppText(
                    text: '\$${product.productPrice}',
                    color: Colors.blue,
                  ),
                ],
              ),
              verticalSpace(10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    const AppHeartIconButton(),
                    horizontalSpace(20),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.add_shopping_cart_rounded),
                        onPressed: () {},
                        label: const AppText(
                          text: 'Added To Card',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    child: AppText(
                      text: 'About This Item',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  AppText(
                    text: product.productCategory,
                    color: Colors.blue,
                  ),
                ],
              ),
              verticalSpace(20),
              AppText(text: product.productDescription),
            ],
          ),
        ),
      ),
    );
  }
}
