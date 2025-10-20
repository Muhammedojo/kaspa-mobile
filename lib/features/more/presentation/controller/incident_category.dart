import 'package:flutter/material.dart';
import '../contract/incident_category.dart';
import '../view/incident_category.dart';

class IncidentCategoryScreen extends StatefulWidget {
  const IncidentCategoryScreen({super.key});

  @override
  State<IncidentCategoryScreen> createState() => _IncidentCategoryScreenState();
}

class _IncidentCategoryScreenState extends State<IncidentCategoryScreen>
    implements IncidentCategoryControllerContract {
  late final IncidentCategoryViewContract view;

  @override
  void initState() {
    super.initState();
    view = IncidentCategoryView(controller: this);
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
