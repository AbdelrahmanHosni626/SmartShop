import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/theming/colors.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/user/logic/cubits/user_cubit.dart';
import 'package:smartshop/features/user/logic/cubits/user_states.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserErrorState) {
          return Center(child: Text(state.error));
        } else if (state is UserSuccessState) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lightCard,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.surface,
                    width: 3.w,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/12225/12225935.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: state.user.userName,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  AppText(
                    text: state.user.userEmail,
                    fontSize: 14.sp,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
