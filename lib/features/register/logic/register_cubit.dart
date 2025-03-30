import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartshop/features/register/data/models/user_model.dart';
import 'package:smartshop/features/register/logic/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  File? file;
  Future<void> getImageFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    file = File(pickedImage!.path);

    emit(RegisterGetImageFromCameraState());
  }

  Future<void> getImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    file = File(pickedImage!.path);

    emit(RegisterGetImageFromGalleryState());
  }

  Future<void> removeImage() async {
    file = null;

    emit(RegisterRemoveImageState());
  }

  late dynamic credential;

  Future<String> _uploadUserImage() async {
    emit(SaveUserImageLoadingState());

    try {
      final Reference ref = FirebaseStorage.instance
          .ref()
          .child("usersImages")
          .child("${credential.user!.uid}.jpg");

      await ref.putFile(file!);
      String imageUrl = await ref.getDownloadURL();

      emit(SaveUserImageSuccessState());
      return imageUrl;
    } catch (error) {
      debugPrint("error is: $error @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      emit(SaveUserImageErrorState(error.toString()));
      return "";
    }
  }

  Future<void> registerWithEmailAndPassword({
    required String email,
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    emit(RegisterLoadingState());
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      String? imageUrl;
      if (file != null) {
        imageUrl = await _uploadUserImage();
      }
      await _saveUserData(
        userEmail: email,
        userName: userName,
        userImage: imageUrl ?? "",
      );
      debugPrint("email is: $email password is: $password ImageUrl is: $file");
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  Future<void> _saveUserData({
    required String userName,
    required String userEmail,
    required String userImage,
  }) async {
    emit(SaveUserDataLoadingState());

    User userData = credential.user!;
    UserModel user = UserModel(
      userId: userData.uid,
      userName: userName,
      userEmail: userEmail,
      userImage: userImage,
      userCart: [],
      userWishlist: [],
      createdAt: Timestamp.now(),
    );

    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData.uid)
        .set(user.toJson())
        .then((value) {
          emit(SaveUserDataSuccessState());
        })
        .catchError((error) {
          emit(SaveUserDataErrorState(error.toString()));
        });
  }
}
