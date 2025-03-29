import 'package:smartshop/features/register/data/models/user_model.dart';

abstract class UserStates {}

class UserInitialState extends UserStates {}

class UserLoadingState extends UserStates {}

class UserSuccessState extends UserStates {
  final UserModel user;
  UserSuccessState(this.user);
}

class UserErrorState extends UserStates {
  final String error;
  UserErrorState(this.error);
}
