abstract class LoginStates {}

class LoginWithEmailInitialState extends LoginStates {}

class LoginWithEmailLoadingState extends LoginStates {}

class LoginWithEmailSuccessState extends LoginStates {}

class LoginWithEmailErrorState extends LoginStates {
  final String error;
  LoginWithEmailErrorState(this.error);
}

class LoginWithGoogleLoadingState extends LoginStates {}

class LoginWithGoogleSuccessState extends LoginStates {}

class LoginWithGoogleErrorState extends LoginStates {
  final String error;
  LoginWithGoogleErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends LoginStates {}