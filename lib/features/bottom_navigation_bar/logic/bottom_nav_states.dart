abstract class BottomNavStates {}

class BottomNavInitialState extends BottomNavStates {}

class ChangeBottomNavigationBarState extends BottomNavStates{}

class FindProductByIdState extends BottomNavStates{}

class SearchProductState extends BottomNavStates{}

class SignOutLoadingState extends BottomNavStates {}

class SignOutSuccessState extends BottomNavStates {}

class SignOutErrorState extends BottomNavStates {
  final String error;
  SignOutErrorState(this.error);
}