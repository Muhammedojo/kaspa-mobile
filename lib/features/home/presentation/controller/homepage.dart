import 'package:flutter/material.dart';
import '../contract/homepage.dart';
import '../view/homepage.dart';


class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    implements HomePageControllerContract {
  late final HomePageViewContract view;

  @override
  void initState() {
    //context.read<UserCubit>().getUser;
    super.initState();

    view = HomePageView(controller: this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
   void logout() {
  //   GetIt.I.get<LocalStorage>().setLoggedIn(false);
  //   context.goNamed(RouteConstants.login);
  //   GetIt.I.get<LocalStorage>().closeDb();
   }

  @override
  Widget build(BuildContext context) {
    return view.build(context);
  }
}
