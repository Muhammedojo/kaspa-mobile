import 'package:flutter/material.dart';
import '../contract/login.dart';
import '../view/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    implements LoginControllerContract {
  late final LoginViewContract view;

  @override
  void initState() {
    super.initState();
    view = LoginView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
