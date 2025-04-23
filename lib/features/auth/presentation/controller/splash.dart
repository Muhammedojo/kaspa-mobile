import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/navigation/route_constant.dart';
import '../contract/splash.dart';
import '../view/splash.dart';

class SplashScreen extends StatefulWidget {
  static const route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    implements SplashControllerContract {
  late final SplashViewContract view;

  @override
  void initState() {
    super.initState();

    view = SplashView(
      controller: this,
    );
  
    onAnimationComplete();
  }

  void onAnimationComplete() {
    Future.delayed(const Duration(seconds: 5), () async {
    
        if (mounted) {
          context.goNamed(RouteConstant.homePage);
        }
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
