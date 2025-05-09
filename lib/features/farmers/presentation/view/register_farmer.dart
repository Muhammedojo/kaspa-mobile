import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:kaspa/core/utils/extensions.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/utils/styles.dart';
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
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.customAppBar(context, 'register_farmer'),

                  'firstName'.toText(fontSize: 14, fontWeight: FontWeight.w500),
                  Padding(
                    padding: REdgeInsets.only(top: 5.0),
                    child: TextFormField(
                      controller: controller.firstNameController,
                      style: Styles.x14dp_4A4A4A(14.0.sp),
                      maxLines: 1,
                      validator: ValidationBuilder().required().build(),
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      decoration:
                          Styles.textFormFieldDecorationBorderWithBackground(
                            'Muhammad',
                            '',
                            check: false,
                          ),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
