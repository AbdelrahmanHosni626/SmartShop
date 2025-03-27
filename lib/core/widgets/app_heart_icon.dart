import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class AppHeartIconButton extends StatelessWidget {
  final Color? bgColor;
  final Color? fgColor;
  const AppHeartIconButton({super.key, this.bgColor, this.fgColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor,
      foregroundColor: fgColor,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(IconlyLight.heart),
      ),
    );
  }
}
