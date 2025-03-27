import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final bool isLoading;

  const AppElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.padding,
    this.borderRadius,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
        ),
        padding: padding ?? EdgeInsets.all(20.r),
      ),
      onPressed: onPressed,
      child:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : AppText(text: text),
    );
  }
}
