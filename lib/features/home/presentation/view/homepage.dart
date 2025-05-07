import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/component/pages_bar.dart';
import '../contract/homepage.dart';

class HomePageView extends StatelessWidget implements HomePageViewContract {
  const HomePageView({super.key, required this.controller});

  final HomePageControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.transparent, body: _body(context));
  }

  Widget _body(context) {
    return Container(
      decoration:Styles.colorComboDecoration(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PageBar(onTap: () { controller.logout(); },),

              // 200.verticalSpace,
              // BlocBuilder<UserCubit, UserState>(
              //   builder: (context, stateBloc) {
              //     if (stateBloc is UserLoaded) {
              //       return Text(
              //         'User is ${stateBloc.login.username.toString()}',
              //       );
              //     }
              //     return 'N/A'.toText();
              //   },
              // ),
              // BlocBuilder<UserCubit, UserState>(
              //   builder: (context, stateBloc) {
              //     if (stateBloc is UserLoaded) {
              //       return Text(
              //         'User is ${stateBloc.login.username.toString()}',
              //       );
              //     }
              //     return 'N/A'.toText();
              //   },
              // ),
              // BlocBuilder<UserCubit, UserState>(
              //   builder: (context, stateBloc) {
              //     if (stateBloc is UserLoaded) {
              //       return Text(
              //         'User is ${stateBloc.login.username.toString()}',
              //       );
              //     }
              //     return 'N/A'.toText();
              //   },
              // ),
              // BlocBuilder<UserCubit, UserState>(
              //   builder: (context, stateBloc) {
              //     if (stateBloc is UserLoaded) {
              //       return Text(
              //         'User is ${stateBloc.login.username.toString()}',
              //       );
              //     }
              //     return 'N/A'.toText();
              //   },
              // ),
              // 200.verticalSpace,
              // 200.verticalSpace,
              // 200.verticalSpace,
              // BlocBuilder<UserCubit, UserState>(
              //   builder: (context, stateBloc) {
              //     if (stateBloc is UserLoaded) {
              //       return Text(
              //         'User is ${stateBloc.login.username.toString()}',
              //       );
              //     }
              //     return 'N/A'.toText();
              //   },
              // ),
           
            ],
          ),
        ),
      ),
    );
  }
}
