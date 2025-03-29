import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smartshop/core/widgets/app_empty_bag.dart';
import 'package:smartshop/features/cart/ui/widgets/bottom_cart_checkout.dart';
import 'package:smartshop/features/cart/ui/widgets/shopping_basket_listview_item.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';
import 'package:smartshop/features/user/ui/widgets/app_bar_title.dart';
import 'package:smartshop/generated/assets.dart';

class CartScreen extends StatelessWidget {
  final bool isEmpty = false;

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const Scaffold(
          body: AppEmptyBag(
            imageUrl: Assets.bagShoppingBasket,
            title: 'Your Cart is empty',
            subTitle:
                'Looks like you have not added anything to your cart yet \nGo ahead and start shopping now',
            buttonText: 'Shop Now',
          ),
        )
        : Scaffold(
          bottomSheet: const BottomCartCheckout(),
          appBar: AppBar(
            leading: Image.asset(Assets.bagShoppingCart),
            title: const AppBarTitle(title: 'Shopping Basket', fontSize: 25),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(IconlyLight.delete, color: Colors.red),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: ProductModel.products.length,
            itemBuilder:
                (context, index) => ShoppingBasketListViewItem(
                  product: ProductModel.products[index],
                ),
          ),
        );
  }
}
