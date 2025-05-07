import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kaspa/core/utils/extensions.dart';
import '../../../../core/component/pattern_color.dart';
import '../../../../core/navigation/navigator.dart';
import '../../../../core/resources/images.dart';
import '../../../../core/theme/colors.dart';
import '../controller/login.dart';
import '../controller/reset_password.dart';

class Auths extends StatefulWidget {
  const Auths({super.key});

  @override
  State<Auths> createState() => _AuthsState();
}

class _AuthsState extends State<Auths> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          WidgetWrapper(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pattern.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [Text('')],
              ),
            ),
          ),
          SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 12.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset(AppImage.horizontalLogo)],
                  ),
                  'KASPA Digitally Connects Farmers to '.toText(
                    fontSize: 18,
                    translate: false,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                  ),
                  'Resources, Markets, and Support.'.toText(
                    fontSize: 18,
                     translate: false,
                    fontWeight: FontWeight.w600,
                    color: AppColors.accentText,
                  ),
                  30.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            pushTo(LoginScreen(), context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.sp),
                              color: AppColors.primaryGreen,
                            ),
                            child: Padding(
                              padding: REdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 32,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  'log_in'.toText(
                                    fontSize: 14,
                                    color: AppColors.primaryBackground,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    color: AppColors.primaryBackground,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            pushTo(ResetPasswordScreen(), context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.sp),
                              color: AppColors.primaryBackground,
                              border: Border.all(color: AppColors.accentText),
                            ),
                            child: Padding(
                              padding: REdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 32,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  'reset_your_password'.toText(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_outlined,
                                    size: 14.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
