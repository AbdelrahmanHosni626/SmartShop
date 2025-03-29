import 'package:flutter/material.dart';
import 'package:smartshop/features/user/ui/widgets/app_bar_title.dart';
import 'package:smartshop/generated/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double fontSize;
  const CustomAppBar({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(Assets.bagShoppingCart),
      title: AppBarTitle(title: title, fontSize: fontSize),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
