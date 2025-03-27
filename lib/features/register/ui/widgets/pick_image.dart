import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartshop/core/helpers/extensions.dart';
import 'package:smartshop/core/helpers/spacing.dart';
import 'package:smartshop/core/widgets/app_text.dart';
import 'package:smartshop/features/register/logic/register_cubit.dart';

class PickImage extends StatelessWidget {
  const PickImage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubit.get(context);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: cubit.file != null
                ? Image.file(
              cubit.file!,
              fit: BoxFit.cover,
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
                              onPressed: () async {
                                  await cubit
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
                              onPressed: () async {
                                await cubit.getImageFromGallery();
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
                              onPressed: () async{
                                await cubit.removeImage();
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
    );
  }
}
