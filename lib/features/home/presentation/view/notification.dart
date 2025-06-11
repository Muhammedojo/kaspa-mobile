import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/component/card_container_widget.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../bloc/notification/cubit.dart';
import '../contract/notification.dart';

class NotificationView extends StatelessWidget
    implements NotificationViewContract {
  const NotificationView({super.key, required this.controller});

  final NotificationControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Container(
      decoration: Styles.colorComboDecoration(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Utils.customAppBar(context, 'notifications', false, () {}),
            20.verticalSpace,
            Expanded(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.verticalSpace,

                    16.verticalSpace,
                    Expanded(
                      child: BlocBuilder<NotificationCubit, NotificationState>(
                        builder: (context, state) {
                          if (state is NotificationLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is NotificationLoaded) {
                            return state.notificationList.isEmpty
                                ? ErrorWidgets(
                                  message: 'notification_list_empty',
                                )
                                : ListView.separated(
                                  itemCount: state.notificationList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return CardContainerWidget();
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          12.verticalSpace,
                                );
                          }
                          if (state is NotificationFailure) {
                            return ErrorWidgets(
                              title: "Error",
                              message: state.toString(),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
