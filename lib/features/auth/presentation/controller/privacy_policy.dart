import 'package:flutter/material.dart';
import '../contract/privacy_policy.dart';
import '../view/privacy_policy.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  static const route = '/';
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen>
    implements PrivacyPolicyControllerContract {
  late final PrivacyPolicyViewContract view;

  @override
  void initState() {
    super.initState();

    view = PrivacyPolicyView(controller: this);
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
