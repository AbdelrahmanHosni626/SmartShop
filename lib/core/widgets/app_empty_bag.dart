import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_elevated_button.dart';
import 'package:smartshop/core/widgets/app_text.dart';

class AppEmptyBag extends StatelessWidget {
  final String imageUrl, subTitle, buttonText;
  final String? title;

  const AppEmptyBag(
      {super.key,
      required this.imageUrl,
      this.title,
      required this.subTitle,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            verticalSpace(20),
            const AppText(
              text: 'Whoops!',
              fontSize: 40,
              color: Colors.red,
            ),
            verticalSpace(20),
            AppText(
              text: title!,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(
                text: subTitle,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            verticalSpace(20),
            AppElevatedButton(
              text: buttonText,
              onPressed: () {}, isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
