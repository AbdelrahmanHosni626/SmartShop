import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smartshop/features/login/logic/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginWithEmailInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserCredential? credential;

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginWithEmailLoadingState());
    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("email is: $email password is: $password **********************");
      emit(LoginWithEmailSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(LoginWithEmailErrorState(e.toString()));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    emit(LoginWithGoogleLoadingState());

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        emit(LoginWithGoogleErrorState("Google sign-in was cancelled"));
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      credential = await FirebaseAuth.instance.signInWithCredential(googleCredential);

      emit(LoginWithGoogleSuccessState());
      return credential;
    } catch (e) {
      emit(LoginWithGoogleErrorState(e.toString()));
      print("${e.toString()} ""^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
      return null;
    }
  }

}
