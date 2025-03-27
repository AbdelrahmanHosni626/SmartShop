import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/features/home/data/models/product_model.dart';
import 'package:smartshop/features/home/ui/widgets/lastest_arrival_item.dart';

class LastArrivalListView extends StatelessWidget {
  const LastArrivalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:  MediaQuery.of(context).size.height * 0.2.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: ProductModel.products.length,
        separatorBuilder: (context, index) => horizontalSpace(10),
        itemBuilder: (context, index) => LastArrivalItem(product:  ProductModel.products[index],),
      ),
    );
  }
}
