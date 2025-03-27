import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/form_validators.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_elevated_button.dart';
import 'package:smartshop/core/widgets/app_text_form_field.dart';

class LoginForm extends StatefulWidget {


  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  bool isPassword = true;

  IconData suffix = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        children:
        [
          AppTextFormField(
            controller: emailController,
            obscureText: false,
            hint: 'youremail@email.com',
            prefix: IconlyLight.message,
            validator: (value) {
              return FormValidators.emailValidator(value);
            },
            onFieldSubmitted: (value) {
              if (loginFormKey.currentState!.validate()) {}
            },
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: passwordController,
            obscureText: isPassword,
            hint: '*************',
            prefix: IconlyLight.password,
            validator: (value) {
              return FormValidators.passwordValidator(value);
            },
            onFieldSubmitted: (value) {
              if (loginFormKey.currentState!.validate()) {}
            },
            suffix: isPassword
                ? Icons.visibility
                : Icons.visibility_off,
            suffixPressed: () {
              setState(() {
                changePasswordVisibility();
              });
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline),
                )),
          ),
          SizedBox(
            width: double.infinity,
            child: AppElevatedButton(
              padding: EdgeInsets.all(1.r),
              onPressed: ()
              {
                context.pushNamed(Routes.bottomNavigationBarScreen);
              },
              text: 'Sign in',
            ),
          ),
        ],
      ),
    );
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword? Icons.visibility : Icons.visibility_off;
  }
}
