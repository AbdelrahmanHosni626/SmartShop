import 'package:flutter/material.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class PleaseLogin extends StatelessWidget {
  const PleaseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Visibility(
      visible: false,
      child: AppText(text: 'Please Login to have ultimate access'),
    );
  }
}
