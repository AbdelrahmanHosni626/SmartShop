import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const AppElevatedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.padding, this.borderRadius,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius:borderRadius ?? BorderRadius.circular(12.r),
        ),
        padding: padding ?? EdgeInsets.all(20.r),
      ),
      onPressed: onPressed,
      child: AppText(
        text: text,
      ),
    );
  }
}
