import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartshop/features/register/logic/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  File? file;
  Future<void> getImageFromCamera()
  async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    file = File(pickedImage!.path);

    emit(RegisterGetImageFromCameraState());
  }

  Future<void> getImageFromGallery()
  async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    file = File(pickedImage!.path);

    emit(RegisterGetImageFromGalleryState());
  }

  Future<void> removeImage()
  async {
    file = null;

    emit(RegisterRemoveImageState());
  }


}