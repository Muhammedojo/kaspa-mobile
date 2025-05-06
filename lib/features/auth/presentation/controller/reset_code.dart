import 'package:flutter/material.dart';
import 'package:kaspa/core/navigation/navigator.dart';
import 'package:kaspa/features/auth/presentation/controller/change_password.dart';
import '../contract/reset_code.dart';
import '../view/reset_code.dart';

class ResetCodeScreen extends StatefulWidget {
  const ResetCodeScreen({super.key, required this.email, required this.token});
  final String email;
  final String token;
  @override
  State<ResetCodeScreen> createState() => _ResetCodeScreenState();
}

class _ResetCodeScreenState extends State<ResetCodeScreen>
    implements ResetCodeControllerContract {
  late final ResetCodeViewContract view;

  @override
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    view = ResetCodeView(controller: this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  String get email => widget.email;

  @override
  String get token => widget.token;

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
  }

  @override
  void onPressButton() async {
    if (mounted) {}
    var code = codeController.text.trim();

    if (code.isNotEmpty && code.length == 6) {
    pushTo(ChangePasswordScreen( token: token,otp: codeController.text.trim(),), context,);
    }
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
