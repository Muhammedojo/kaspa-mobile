import 'package:flutter/material.dart';
import '../contract/terms.dart';
import '../view/terms.dart';

class TermsScreen extends StatefulWidget {
  static const route = '/';
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen>
    implements TermsControllerContract {
  late final TermsViewContract view;

  @override
  void initState() {
    super.initState();

    view = TermsView(controller: this);
  }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
