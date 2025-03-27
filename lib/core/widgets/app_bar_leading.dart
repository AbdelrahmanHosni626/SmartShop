import 'package:flutter/material.dart';
import 'package:smartshop/core/helpers/extensions.dart';

class AppBarLeading extends StatelessWidget {
  const AppBarLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.canPop(context) ? context.pop() : null;
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
      ),
    );
  }
}
