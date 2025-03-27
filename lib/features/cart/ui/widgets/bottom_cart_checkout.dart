import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/logic/app_cubit.dart';
import 'package:smartshop/core/theming/colors.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class BottomCartCheckout extends StatelessWidget {
  const BottomCartCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Container(
      decoration: BoxDecoration(
        color:  cubit.getIsDarkMode ? AppColors.darkScaffold : AppColors.lightScaffold,
        border: Border(top: BorderSide(width: 1, color: Colors.grey.shade300)),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 15.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
          child: Row(
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: AppText(
                        text: 'Total (6 Products/6 items)',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    AppText(
                      text: '\$50.00',
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Checkout',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
