import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/theming/colors.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.lightCard,
            border: Border.all(
              color: Theme.of(context).colorScheme.background,
              width: 3.w,
            ),
            image: const DecorationImage(
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/12225/12225935.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Abdelrahman Hosni',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            AppText(
              text: 'abdohosny626@gmail.com',
              fontSize: 14.sp,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
