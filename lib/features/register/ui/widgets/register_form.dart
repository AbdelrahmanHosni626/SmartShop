import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/form_validators.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_elevated_button.dart';
import 'package:smartshop/core/widgets/app_text_form_field.dart';
import 'package:smartshop/features/register/logic/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  final bool isLoading;
  const RegisterForm({super.key, required this.isLoading});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final registerFormKey = GlobalKey<FormState>();

  bool isPassword = true;

  IconData suffix = Icons.visibility;

  bool isConfirmPassword = true;

  IconData confirmSuffix = Icons.visibility;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: userNameController,
            obscureText: false,
            hint: 'User123',
            prefix: IconlyLight.user2,
            validator: (value) {
              return FormValidators.displayNameValidator(value);
            },
            onFieldSubmitted: (value) {
              if (registerFormKey.currentState!.validate()) {}
            },
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: emailController,
            obscureText: false,
            hint: 'youremail@email.com',
            prefix: IconlyLight.message,
            validator: (value) {
              return FormValidators.emailValidator(value);
            },
            onFieldSubmitted: (value) {
              if (registerFormKey.currentState!.validate()) {}
            },
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: passwordController,
            obscureText: isPassword,
            hint: '*********',
            prefix: IconlyLight.password,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              return FormValidators.passwordValidator(value);
            },
            onFieldSubmitted: (value) {
              if (registerFormKey.currentState!.validate()) {}
            },
            suffix: isPassword ? Icons.visibility : Icons.visibility_off,
            suffixPressed: () {
              setState(() {
                changePasswordVisibility();
              });
            },
          ),
          verticalSpace(10),
          AppTextFormField(
            controller: confirmPasswordController,
            obscureText: isConfirmPassword,
            hint: '*********',
            prefix: IconlyLight.password,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              return FormValidators.repeatPasswordValidator(
                value: value,
                password: passwordController.text,
              );
            },
            onFieldSubmitted: (value) {
              if (registerFormKey.currentState!.validate()) {}
            },
            suffix: isConfirmPassword ? Icons.visibility : Icons.visibility_off,
            suffixPressed: () {
              setState(() {
                changeConfirmPasswordVisibility();
              });
            },
          ),
          verticalSpace(40),
          SizedBox(
            width: double.infinity,
            child: AppElevatedButton(
              isLoading: widget.isLoading,
              padding: EdgeInsets.all(1.r),
              onPressed: () {
                final registerCubit = context.read<RegisterCubit>();
                if (registerFormKey.currentState!.validate()) {
                  registerCubit.registerWithEmailAndPassword(
                    email: emailController.text.trim(),
                    userName: userNameController.text.trim(),
                    password: passwordController.text.trim(),
                    confirmPassword: confirmPasswordController.text.trim(),

                  );
                }
              },
              text: 'Sign up',
            ),
          ),
        ],
      ),
    );
  }

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    confirmSuffix = isConfirmPassword ? Icons.visibility : Icons.visibility_off;
  }
}
