import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:ionicons/ionicons.dart';

class OrConnectUsing extends StatelessWidget {
  const OrConnectUsing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        const Align(
          alignment: Alignment.center,
          child: AppText(
            text: 'OR CONNECT USING',
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        verticalSpace(20),
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Ionicons.logo_google,
                  size: 30, color: Colors.red),
              label: const Text('Sign in with Google'),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {},
              child: const Text('Guest?'),
            ),
          ],
        ),
      ],
    );
  }
}
