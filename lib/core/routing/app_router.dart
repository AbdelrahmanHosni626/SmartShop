import 'package:flutter/material.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/features/bottom_navigation_bar/ui/bottom_navigation_bar_screen.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';
import 'package:smartshop/features/inner_screens/ui/all_orders.dart';
import 'package:smartshop/features/inner_screens/ui/product_details.dart';
import 'package:smartshop/features/inner_screens/ui/viewd_recently.dart';
import 'package:smartshop/features/inner_screens/ui/wishlist.dart';
import 'package:smartshop/features/login/ui/login_screen.dart';
import 'package:smartshop/features/register/ui/register_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case Routes.bottomNavigationBarScreen:
        return MaterialPageRoute(builder: (_) => BottomNavigationBarScreen());

      case Routes.productDetails:
        late final productModel = settings.arguments;
        return MaterialPageRoute(builder: (_) => ProductDetails(product: productModel as ProductModel,));

      case Routes.allOrders:
        return MaterialPageRoute(builder: (_) => const AllOrdersScreen());

      case Routes.wishlist:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());

      case Routes.viewedRecently:
        return MaterialPageRoute(builder: (_) => const ViewedRecentlyScreen());

      default:
        return null;
    }
  }
}
