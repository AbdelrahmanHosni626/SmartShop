import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smartshop/bloc_observer.dart';
import 'package:smartshop/core/routing/app_router.dart';
import 'package:smartshop/smart_app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    SmartApp(
      appRouter: AppRouter(),
    ),
  );
}
