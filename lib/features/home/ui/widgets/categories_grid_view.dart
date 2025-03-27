import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/features/home/data/models/category_model.dart';
import 'package:smartshop/features/home/ui/widgets/categories_item.dart';
import 'package:smartshop/generated/assets.dart';

class CategoriesGridView extends StatelessWidget {
  final List<CategoryModel> categories = [
    CategoryModel(
      id: Assets.categoriesMobiles,
      image: Assets.categoriesMobiles,
      name: 'Phones',
    ),
    CategoryModel(
      id: Assets.categoriesPc,
      image: Assets.categoriesPc,
      name: 'Laptops',
    ),
    CategoryModel(
      id: Assets.categoriesElectronics,
      image: Assets.categoriesElectronics,
      name: 'Electronics',
    ),
    CategoryModel(
      id: Assets.categoriesWatch,
      image: Assets.categoriesWatch,
      name: 'Watches',
    ),
    CategoryModel(
      id: Assets.categoriesFashion,
      image: Assets.categoriesFashion,
      name: 'Clothes',
    ),
    CategoryModel(
      id: Assets.categoriesShoes,
      image: Assets.categoriesShoes,
      name: 'Shoes',
    ),
    CategoryModel(
      id: Assets.categoriesBookImg,
      image: Assets.categoriesBookImg,
      name: 'Books',
    ),
    CategoryModel(
      id: Assets.categoriesCosmetics,
      image: Assets.categoriesCosmetics,
      name: 'Cosmetics',
    ),
  ];

  CategoriesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      children: List.generate(
        categories.length,
        (index) => CategoriesItem(
          image: categories[index].image,
          name: categories[index].name,
        ),
      ),
    );
  }
}
