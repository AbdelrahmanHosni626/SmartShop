import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartshop/features/register/data/models/user_model.dart';
import 'package:smartshop/features/user/logic/cubits/user_states.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());

  static UserCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> getUserData() async {
    emit(UserLoadingState());
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;

      DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();

      if (doc.exists) {
        userModel = UserModel.fromJson(doc.data() as Map<String, dynamic>);
        emit(UserSuccessState(userModel!));
      } else {
        emit(UserErrorState("User data not found"));
      }
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
