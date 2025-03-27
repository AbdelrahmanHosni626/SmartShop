import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextStyle? inputTextStyle;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? keyboardType;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final String hint;
  final IconData prefix;
  final IconData? suffix;
  final Function? suffixPressed;
  final bool isPassword = false;

  const AppTextFormField(
      {super.key,
      required this.controller,
      this.inputTextStyle,
      this.onChanged,
      this.onFieldSubmitted,
      this.keyboardType,
      required this.obscureText,
      this.validator,
      required this.hint,
      required this.prefix,
      this.suffix,
      this.suffixPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(onPressed: (){suffixPressed!();}, icon: Icon(suffix)),
      ),
    );
  }
}
