import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/create_farmer/create_farmer_cubit.dart';
import '../bloc/create_farmer/create_farmer_state.dart';
import '../contract/register_farmer.dart';

class RegisterFarmerView extends StatelessWidget
    implements RegisterFarmerViewContract {
  const RegisterFarmerView({super.key, required this.controller});

  final RegisterFarmerControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: BlocListener<CreateFarmerCubit, CreateFarmerState>(
        listener: (stateContext, state) {
          if (state is CreateFarmerLoading) {
            context.loaderOverlay.show();
          }
          if (state is CreateFarmerFailure) {
            context.loaderOverlay.hide();
            Text('Failed');
          }
          if (state is CreateFarmerSuccess) {
            context.loaderOverlay.hide();
            controller.clearScreen();
            Text('Success');
          }
        },
        child: _body(context),
      ),
    );
  }

  Widget _body(context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(24.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'firstName'.toText(fontSize: 14, fontWeight: FontWeight.w500),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
