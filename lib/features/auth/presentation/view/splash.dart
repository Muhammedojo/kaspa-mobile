import 'package:flutter/material.dart';
import '../contract/splash.dart';

class SplashView extends StatelessWidget implements SplashViewContract {
  const SplashView({super.key, required this.controller});

  final SplashControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
           Image.asset('assets/images/splash.jpg')
            // App Version Text at Bottom
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: REdgeInsets.only(bottom: 30),
            //     child: "v.${const String.fromEnvironment("version", defaultValue: "1.0.72")}+${const String.fromEnvironment("build_number", defaultValue: "72")}".toText(translate: false, color: Colors.white)
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
