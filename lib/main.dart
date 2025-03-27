import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:smartshop/bloc_observer.dart';
import 'package:smartshop/core/routing/app_router.dart';
import 'package:smartshop/smart_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    SmartApp(
      appRouter: AppRouter(),
    ),
  );
}
