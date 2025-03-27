import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/custom_app_bar.dart';
import 'package:smartshop/features/bottom_navigation_bar/logic/bottom_nav_cubit.dart';
import 'package:smartshop/features/profile/ui/widgets/general_section.dart';
import 'package:smartshop/features/profile/ui/widgets/others_section.dart';
import 'package:smartshop/features/profile/ui/widgets/please_login.dart';
import 'package:smartshop/features/profile/ui/widgets/setting_section.dart';
import 'package:smartshop/features/profile/ui/widgets/user_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'SmartShop', fontSize: 25),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PleaseLogin(),
              const UserInfo(),
              verticalSpace(10),
              const GeneralSection(),
              const Divider(thickness: 1),
              verticalSpace(7),
              const SettingSection(),
              const Divider(thickness: 1),
              verticalSpace(20),
              OthersSection(bottomNavCubit: context.read<BottomNavCubit>(),),

            ],
          ),
        ),
      ),
    );
  }
}
