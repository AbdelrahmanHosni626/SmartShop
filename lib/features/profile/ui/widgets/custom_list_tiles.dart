import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTiles extends StatelessWidget {

  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const CustomListTiles({super.key, required this.imageUrl, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(imageUrl, height: 30.h,),
      title: Text(title, style: const TextStyle(fontSize: 20),),
      trailing: const Icon(IconlyBold.arrowRight2),
    );
  }
}
