import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/login/logic/login_cubit.dart';
import 'package:smartshop/features/login/logic/login_states.dart';
import 'package:smartshop/features/login/ui/widgets/login_form.dart';
import 'package:smartshop/features/login/ui/widgets/or_connect_using.dart';
import 'package:smartshop/features/user/ui/widgets/app_bar_title.dart';
import 'package:smartshop/generated/assets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: 'SmartShop', fontSize: 25),
          centerTitle: true,
        ),
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginWithEmailLoadingState) {
              isLoading = true;
            }
            if (state is LoginWithEmailErrorState) {
              isLoading = false;
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(Assets.imagesWarning, height: 100.h),
                        verticalSpace(20),
                        AppText(text: state.error.toString()),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: const Text(
                          'OK',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.canPop(context) ? context.pop() : null;
                        },
                      ),
                    ],
                  );
                },
              );
            }
            if (state is LoginWithEmailSuccessState) {
              isLoading = false;
              context.pushNamed(Routes.bottomNavigationBarScreen);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppText(
                        text: 'Welcome Back',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpace(30),
                      LoginForm(isLoading: isLoading),
                      verticalSpace(30),
                      const OrConnectUsing(),
                      verticalSpace(20),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const AppText(
                              text: 'Don\'t have an account?',
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            TextButton(
                              onPressed: () {
                                context.pushNamed(Routes.register);
                              },
                              child: const Text('Sign up'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
