import 'package:flutter/material.dart';
import 'package:husam4alabs/features/home/home.dart';
import 'package:husam4alabs/features/intro/splash.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    /// TODO: instead of waiting fetch data from server
    /// (ex: settings - check auth token)
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const SplashScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white70,
      alignment: Alignment.center,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
