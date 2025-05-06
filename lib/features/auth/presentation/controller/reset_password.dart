import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/forgot_password/forgot_password_cubit.dart';
import '../contract/reset_password.dart';
import '../view/reset_password.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    implements ResetPasswordControllerContract {
  late final ResetPasswordViewContract view;

  @override
  TextEditingController emailController = TextEditingController();

  @override
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController(text: "gemdajs@gmail.com");

    view = ResetPasswordView(controller: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  void onPressButton() {
    if (formKey.currentState!.validate()) {
      if (mounted) {
        context.read<ForgotPasswordCubit>().forgotPassword(
          emailController.text.trim(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
