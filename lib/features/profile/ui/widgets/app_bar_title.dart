
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const AppBarTitle({super.key, required this.title, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
    baseColor: Colors.purple,
    highlightColor: Colors.red,
    period: const Duration(seconds: 6),
    child: AppText(text: title, fontSize: fontSize,),);
  }
}
