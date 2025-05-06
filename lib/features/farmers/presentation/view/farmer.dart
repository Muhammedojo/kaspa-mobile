import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/images.dart';
import '../../../../core/component/empty_list_widget.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/theme/colors.dart';
import '../bloc/get_farmer/get_farmer_cubit.dart';
import '../bloc/get_farmer/get_farmer_state.dart';
import '../contract/farmer.dart';
import '../controller/register_farmer.dart';
import '../widget/farmer_item_widget.dart';

class FarmerView extends StatelessWidget implements FarmerViewContract {
  const FarmerView({super.key, required this.controller});

  final FarmerControllerContract controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryGreen,
        onPressed: () => pushTo(RegisterFarmerScreen(), context),
        child: Icon(Icons.add, color: AppColors.primaryBackground),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Image.asset(AppImage.horizontalLogo)]),
            'farmers'.toText(fontSize: 20, fontWeight: FontWeight.w700),
            Expanded(
              child: BlocBuilder<GetFarmersCubit, GetFarmersState>(
                builder: (context, state) {
                  if (state is FarmerListLoading) {
                    return 
                    //const Center(child: CircularProgressIndicator());
                    ErrorWidgets(title: "Empty", message: '');
                  }
                  if (state is FarmerListLoaded) {
                    return state.dataList.isEmpty
                        ? ErrorWidgets(message: 'farmer_list_empty')
                        : ListView.separated(
                          itemCount: state.dataList.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return FarmerCard(
                              //  farmer: state.dataList[index],
                              // onTap: () {
                              //   showCustomBottomSheet(context,
                              //       child: PreviewFarmer(
                              //         farmer: state.dataList[index],
                              //       ));
                              // }
                            );
                          },
                          separatorBuilder:
                              (BuildContext context, int index) =>
                                  12.verticalSpace,
                        );
                  }
                  if (state is FarmerListFailure) {
                    return ErrorWidgets(title: "Error", message: state.error);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
