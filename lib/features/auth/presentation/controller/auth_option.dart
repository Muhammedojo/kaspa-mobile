import 'package:flutter/material.dart';
import '../../../../core/navigation/navigator.dart';
import '../contract/auth_option.dart';
import '../view/auth_option.dart';
import 'login.dart';
import 'reset_password.dart';

class AuthOptionScreen extends StatefulWidget {
  const AuthOptionScreen({super.key});

  @override
  State<AuthOptionScreen> createState() => _AuthOptionScreenState();
}

class _AuthOptionScreenState extends State<AuthOptionScreen>
    implements AuthOptionControllerContract {
  late final AuthOptionViewContract view;

  @override
  @override
  void initState() {
    super.initState();

    view = AuthOptionView(controller: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }

  @override
  void navigateToLogin() {
    pushTo(LoginScreen(), context);
  }

  @override
  void navigateToResetPassword() {
    pushTo(ResetPasswordScreen(), context);
  }
}
