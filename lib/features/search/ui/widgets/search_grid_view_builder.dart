import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';
import 'package:smartshop/features/search/ui/widgets/search_grid_view_builder_item.dart';

class SearchGridViewBuilder extends StatelessWidget {
  const SearchGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: DynamicHeightGridView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        builder: (context, index) => SearchGridViewBuilderItem(product: ProductModel.products[index],),
        crossAxisCount: 2,
      ),
    );
  }
}
