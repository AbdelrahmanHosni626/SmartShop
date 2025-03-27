import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class CategoriesItem extends StatelessWidget {
  final String image, name;

  const CategoriesItem({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(image),
          ),
          verticalSpace(5),
          AppText(
            text: name,
            fontSize: 14.sp,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
