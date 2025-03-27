import 'package:flutter/material.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/core/widgets/custom_app_bar.dart';
import 'package:smartshop/features/home/ui/widgets/categories_grid_view.dart';
import 'package:smartshop/features/home/ui/widgets/home_banners.dart';
import 'package:smartshop/features/home/ui/widgets/latest_arrival_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'SmartShop', fontSize: 25),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeBanners(),
              verticalSpace(30),
              const AppText(text: 'Latest Arrival', fontSize: 20, fontWeight: FontWeight.bold,),
              verticalSpace(20),
              const LastArrivalListView(),
              verticalSpace(30),
              const AppText(text: 'Categories', fontSize: 20, fontWeight: FontWeight.bold,),
              verticalSpace(20),
              CategoriesGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
