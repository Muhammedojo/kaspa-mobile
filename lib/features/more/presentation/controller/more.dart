import 'package:flutter/material.dart';
import '../contract/more.dart';
import '../view/more.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen>
    implements MoreControllerContract {
  late final MoreViewContract view;

  @override
  void initState() {
    super.initState();
    view = MoreView(controller: this);
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
