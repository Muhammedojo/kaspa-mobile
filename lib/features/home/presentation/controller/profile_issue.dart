import 'package:flutter/material.dart';
import '../contract/profile_issue.dart';
import '../view/profile_issue.dart';


class ProfileIssueScreen extends StatefulWidget {
  const ProfileIssueScreen({super.key});

  @override
  State<ProfileIssueScreen> createState() => _ProfileIssueScreenState();
}

class _ProfileIssueScreenState extends State<ProfileIssueScreen>
    implements ProfileIssueControllerContract {
  late final ProfileIssueViewContract view;

  

  @override
  void initState() {

    super.initState();
    view = ProfileIssueView(controller: this);
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

