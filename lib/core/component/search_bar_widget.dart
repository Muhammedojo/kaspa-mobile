import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/vectors.dart';
import '../theme/colors.dart';

class SearchBarWidget extends StatelessWidget {
  final String hint;
  final Function(String?) onTextChanged;
  final TextEditingController searchController;
  final Function() onClearSearch;
  final bool isSearching;
  const SearchBarWidget({
    super.key,
    required this.hint,
    required this.onTextChanged,
    required this.searchController,
    required this.onClearSearch,
    required this.isSearching,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52.h,
            padding: REdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.ColorAccent),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: hint.tr(),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.ColorAccent,
                      ),
                    ),
                    onChanged: onTextChanged,
                  ),
                ),
                if (isSearching)
                  IconButton(
                    icon: Icon(Icons.cancel, color: AppColors.ColorAccent),
                    onPressed: () {
                      onClearSearch();
                    },
                  )
                else
                  SvgPicture.asset(AppIcon.search),
              ],
            ),
          ),
        ),
        8.horizontalSpace,
        Container(
          height: 52.h,

          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: AppColors.ColorAccent),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 14),
            child: 
            Icon(Icons.filter_alt_rounded,color: AppColors.ColorAccent)
            //SvgPicture.asset(AppIcon.search),
          ),
        ),
      ],
    );
  }
}
