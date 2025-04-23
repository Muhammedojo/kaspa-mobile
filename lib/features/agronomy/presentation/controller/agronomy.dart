import 'package:flutter/material.dart';

import '../contract/agronomy.dart';
import '../view/agronomy.dart';


class AgronomyScreen extends StatefulWidget {
  const AgronomyScreen({super.key});

  @override
  State<AgronomyScreen> createState() => _AgronomyScreenState();
}

class _AgronomyScreenState extends State<AgronomyScreen>
    implements AgronomyControllerContract {
  late final AgronomyViewContract view;

  @override
  void initState() {
    super.initState();
    view = AgronomyView(controller: this);
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
