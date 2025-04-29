import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/storage/istorage.dart';
import '../bloc/auth/auth_cubit.dart';
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
  bool? rememberMe = false;

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
    view = LoginView(controller: this);
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
  void onPressLoginButton() {
    if (formKey.currentState!.validate()) {
      if (mounted) {
        context.read<AuthCubit>().login(
            username: emailController.text.trim(), password: passwordController.text, rememberMe: rememberMe);
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
