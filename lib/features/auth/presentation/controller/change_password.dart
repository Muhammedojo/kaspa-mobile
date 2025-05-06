import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kaspa/features/auth/presentation/bloc/forgot_password/forgot_password_cubit.dart';
import '../../../../core/storage/istorage.dart';
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
  bool? rememberMe = false;

   @override
  String get otp => widget.otp!;

  @override
  String get token => widget.token!;

  @override
  bool obscurePassword = true;

  @override
  TextEditingController emailController = TextEditingController();

  @override
  TextEditingController passwordController = TextEditingController();

  @override
  late GlobalKey<FormState> formKey;

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
     emailController = TextEditingController(text: "gemdajs@gmail.com");
    passwordController = TextEditingController(text: "Default@123");
    view = ChangePasswordView(controller: this);
        WidgetsBinding.instance.addPostFrameCallback((_) async{
      checkRememberMeStatus();
    });
  }

  @override
  void dispose() {
    super.dispose();
      emailController.dispose();
    passwordController.dispose();
  }

    @override
  void forgotPassword() async {}

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

   void checkRememberMeStatus() async{
    bool? status = await GetIt.I.get<LocalStorage>().getRememberMe() ?? false;
    setState(() {
      rememberMe = status;
    });
  }

   @override
  void onSelectRememberMe(bool? status){
    if(status != null) {
      setState(() {
        rememberMe = status;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
