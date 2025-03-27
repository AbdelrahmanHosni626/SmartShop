import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smart_app/core/widgets/app_bar_leading.dart';
import 'package:smart_app/core/widgets/app_empty_bag.dart';
import 'package:smart_app/features/home/data/models/product_model.dart';
import 'package:smart_app/features/inner_screens/ui/widgets/all_orders_list_view_item.dart';
import 'package:smart_app/features/profile/ui/widgets/app_bar_title.dart';
import 'package:smart_app/generated/assets.dart';

class AllOrdersScreen extends StatelessWidget {
  final bool isEmpty = false;

  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const Scaffold(
      body: AppEmptyBag(
        imageUrl: Assets.bagShoppingBasket,
        title: 'Your Placed Orders is empty',
        subTitle:
        'Looks like you have not added anything to your cart yet \nGo ahead and start shopping now',
        buttonText: 'Shop Now',
      ),
    )
        : Scaffold(
      appBar: AppBar(
        leading: const AppBarLeading(),
        title: const AppBarTitle(
          title: 'Placed Orders',
          fontSize: 25,
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
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: ProductModel.products.length,
        itemBuilder: (context, index) => AllOrdersListViewItem(product: ProductModel.products[index],),
      ),
    );
  }
}
