import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartshop/core/logic/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  bool _isDark = false;

  bool get getIsDarkMode => _isDark;
  static const themeStatus = 'THEME_STATUS';

  Future<void> setDarkMode({required bool themeValue}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(themeStatus, themeValue);
    _isDark = themeValue;
    emit(ChangeAppModeState());
  }

  Future<bool> getThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _isDark = pref.getBool(themeStatus) ?? false;
    emit(ChangeAppModeState());
    return _isDark;
  }
}
