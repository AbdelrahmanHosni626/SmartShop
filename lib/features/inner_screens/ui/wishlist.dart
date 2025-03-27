import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/widgets/app_bar_leading.dart';
import 'package:smartshop/core/widgets/app_empty_bag.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_cubit.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_states.dart';
import 'package:smartshop/features/search/ui/widgets/search_grid_view_builder_item.dart';
import 'package:smartshop/generated/assets.dart';

import '../../home/data/models/product_model.dart';

class WishlistScreen extends StatelessWidget {
  final bool isEmpty = false;

  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (isEmpty) {
      return const Scaffold(
      body: AppEmptyBag(
        imageUrl: Assets.bagBagWish,
        title: 'Your Wishlist is empty',
        subTitle:
        'Seems like you don\'t have any wishes here',
        buttonText: 'Make a Wish now',
      ),
    );
    } else {
      return Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const Text(
          'Wishlist(8)',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => BottomNavCubit(),
        child: BlocConsumer<BottomNavCubit, BottomNavStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ProductModel.products.length,
                  builder: (context, index) => SearchGridViewBuilderItem(product: ProductModel.products[index],),
                  crossAxisCount: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
    }
  }
}
