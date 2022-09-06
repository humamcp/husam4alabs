import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:husam4alabs/features/intro/loading.dart';
import 'package:husam4alabs/observers/main_observer.dart';
import 'package:husam4alabs/style/theme.dart';

void main() {
  Bloc.observer = MainObserver();
  runApp(const Husam4aLabs());
}

class Husam4aLabs extends StatelessWidget {
  const Husam4aLabs({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Husam4Alabs',
      theme: AppTheme.APP_THEME,
      home: const LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
