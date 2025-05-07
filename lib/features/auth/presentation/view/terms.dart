import 'package:flutter/material.dart';
import '../contract/terms.dart';

class TermsView extends StatelessWidget implements TermsViewContract {
  const TermsView({super.key, required this.controller});

  final TermsControllerContract controller;

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
