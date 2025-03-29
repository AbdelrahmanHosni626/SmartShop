import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/routing/routes.dart';
import 'package:smartshop/core/widgets/app_bar_leading.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/register/logic/register_cubit.dart';
import 'package:smartshop/features/register/logic/register_states.dart';
import 'package:smartshop/features/register/ui/widgets/register_form.dart';
import 'package:smartshop/features/user/ui/widgets/app_bar_title.dart';
import 'package:smartshop/generated/assets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const AppBarLeading(),
          title: const AppBarTitle(title: 'SmartShop', fontSize: 25),
          centerTitle: true,
        ),
        body: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              isLoading = true;
            }
            if (state is RegisterErrorState) {
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
            if (state is RegisterSuccessState) {
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
                        text: 'Welcome',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      verticalSpace(20),
                      /*Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: size.width * 0.35.w,
                          height: size.width * 0.35.h,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: cubit.file != null
                                      ? SizedBox(
                                    width: double.infinity,
                                        child: Image.file(
                                            cubit.file!,
                                            fit: BoxFit.fill,
                                          ),
                                      )
                                      : Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            border: Border.all(),
                                          ),
                                        ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const AppText(
                                                  text: 'Choose Option',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                verticalSpace(30),
                                                TextButton.icon(
                                                    onPressed: () {
                                                      cubit
                                                          .getImageFromCamera();
                                                      if (Navigator.canPop(
                                                          context)) {
                                                        context.pop();
                                                      }
                                                    },
                                                    icon: const Icon(Icons
                                                        .camera_alt_outlined),
                                                    label:
                                                        const Text('Camera')),
                                                TextButton.icon(
                                                    onPressed: () {
                                                      cubit.getImageFromGallery();
                                                      if (Navigator.canPop(
                                                          context)) {
                                                        context.pop();
                                                      }
                                                    },
                                                    icon: const Icon(
                                                        Icons.photo_outlined),
                                                    label:
                                                        const Text('Gallery')),
                                                TextButton.icon(
                                                    onPressed: () {
                                                      cubit.removeImage();
                                                      if (Navigator.canPop(
                                                          context)) {
                                                        context.pop();
                                                      }
                                                    },
                                                    icon: const Icon(
                                                        Icons
                                                            .remove_circle_outline,
                                                        color: Colors.red),
                                                    label: const Text(
                                                      'Remove',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    icon: const Icon(
                                      IconlyLight.camera,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),*/
                      verticalSpace(30),
                      RegisterForm(isLoading: isLoading),
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
