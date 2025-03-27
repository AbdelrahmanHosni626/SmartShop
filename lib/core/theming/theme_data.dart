import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/theming/colors.dart';

class AppTheme {
  static ThemeData appTheme(
      {required bool isDark, required BuildContext context}) {
    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: isDark ? AppColors.darkScaffold : AppColors.lightScaffold,
      cardColor: isDark ? AppColors.darkCard : AppColors.lightCard,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: isDark ? AppColors.darkScaffold : AppColors.lightScaffold,
        selectedItemColor: isDark ? Colors.deepOrange : Colors.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(size: 35.0),
        elevation: 0.0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? AppColors.darkScaffold : AppColors.lightScaffold,
        titleTextStyle: TextStyle(
          color: isDark ? Colors.white : Colors.black,
        )
      ),
      listTileTheme: ListTileThemeData(
        textColor: isDark ? Colors.white : Colors.black,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled:   true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder:
        OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.r),),
        ),
        focusedBorder:
         OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.r),),
        ),
        errorBorder:
        OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius:  BorderRadius.all(Radius.circular(8.r),),
        ),
      ),
    );
  }
}