import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/function.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/utils/styles.dart';
import '../bloc/advisory_message/cubit.dart';
import '../contract/advisory_messages.dart';
import '../widget/advisory_card.dart';

class AdvisoryMessageView extends StatelessWidget
    implements AdvisoryMessageViewContract {
  const AdvisoryMessageView({super.key, required this.controller});

  final AdvisoryMessageControllerContract controller;

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
            Utils.customAppBar(context, 'advisory_messages', false, () {}),
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
                      child: BlocBuilder<
                        AdvisoryMessageCubit,
                        AdvisoryMessageState
                      >(
                        builder: (context, state) {
                          if (state is AdvisoryMessageLoading) {
                            return ErrorWidgets(title: "empty", message: '');
                          }
                          if (state is AdvisoryMessageLoaded) {
                            return state.advisoryList.isEmpty
                                ? ErrorWidgets(
                                  message: 'advisory_message_list_empty',
                                )
                                : ListView.separated(
                                  itemCount: state.advisoryList.length,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final item = state.advisoryList[index];
                                    return AdvisoryMessageWidget(
                                      data: item,
                                      onTap: () {
                                            controller.previewLogModal(item);
                                      },
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          12.verticalSpace,
                                );
                          }
                          if (state is AdvisoryMessageFailure) {
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
