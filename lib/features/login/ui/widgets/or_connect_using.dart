import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smartshop/features/login/logic/login_cubit.dart';
import 'package:smartshop/features/login/logic/login_states.dart';

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
        BlocListener <LoginCubit, LoginStates>(
          listener: (BuildContext context, LoginStates state) {
            if (state is LoginWithGoogleSuccessState) {
              context.pushReplacementNamed(Routes.bottomNavigationBarScreen);
            }
            else if (state is LoginWithGoogleErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.toString()),
                ),
              );
            }
          },
          child: Row(
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  context.read<LoginCubit>().signInWithGoogle();
                },
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
        ),
      ],
    );
  }
}
