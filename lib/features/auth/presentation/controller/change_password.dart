import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reset_password/reset_password_cubit.dart';
import '../contract/change_password.dart';
import '../view/change_password.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String? otp;
  final String? token;
  const ChangePasswordScreen({super.key, this.otp, this.token});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen>
    implements ChangePasswordControllerContract {
  late final ChangePasswordViewContract view;

  @override
  String get otp => widget.otp!;

  @override
  String get token => widget.token!;

  @override
  TextEditingController passwordController = TextEditingController();

  @override
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  late GlobalKey<FormState> formKey;

  @override
  bool obscurePassword = true;

  @override
  onPasswordVisible() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    view = ChangePasswordView(controller: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    super.dispose();

    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void onPressButton() {
    if (formKey.currentState!.validate()) {
      if (mounted) {
        context.read<ResetPasswordCubit>().changePassword(
          token,
          otp,
          passwordController.text.trim(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
  
  


}
