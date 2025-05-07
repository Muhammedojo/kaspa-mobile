import 'package:flutter/material.dart';
import '../contract/privacy_policy.dart';

class PrivacyPolicyView extends StatelessWidget implements PrivacyPolicyViewContract {
  const PrivacyPolicyView({super.key, required this.controller});

  final PrivacyPolicyControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()

    );
  }
  Widget _body(){
    return Column(children: [],);
  }
}
