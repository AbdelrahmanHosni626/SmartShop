import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class QuantityBottomSheet extends StatelessWidget {
  const QuantityBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          verticalSpace(20),
          Container(
            width: 50.w,
            height: 6.h,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                )),
          ),
          verticalSpace(20),
          Expanded(
            child: ListView.builder(
              physics: const RangeMaintainingScrollPhysics(),
              itemCount: 15,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                        child: AppText(
                      text: (index + 1).toString(),
                      fontSize: 20,
                    ),),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
