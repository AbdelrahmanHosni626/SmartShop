abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class SaveUserDataLoadingState extends RegisterStates {}

class SaveUserDataSuccessState extends RegisterStates {}

class SaveUserDataErrorState extends RegisterStates {
  final String error;
  SaveUserDataErrorState(this.error);
}

class SaveUserImageLoadingState extends RegisterStates {}

class SaveUserImageSuccessState extends RegisterStates {}

class SaveUserImageErrorState extends RegisterStates {
  final String error;
  SaveUserImageErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}
class RegisterChangeConfirmPasswordVisibilityState extends RegisterStates {}


class RegisterGetImageFromCameraState extends RegisterStates {}
class RegisterGetImageFromGalleryState extends RegisterStates {}
class RegisterRemoveImageState extends RegisterStates {}

