import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/login/logic/login_cubit.dart';
import 'package:smartshop/features/login/logic/login_states.dart';
import 'package:smartshop/features/login/ui/widgets/login_form.dart';
import 'package:smartshop/features/login/ui/widgets/or_connect_using.dart';
import 'package:smartshop/features/profile/ui/widgets/app_bar_title.dart';

class LoginScreen extends StatelessWidget {


  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: 'SmartShop',
            fontSize: 25,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context, state) {},
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
                      const LoginForm(),
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
                              onPressed: ()
                              {
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
