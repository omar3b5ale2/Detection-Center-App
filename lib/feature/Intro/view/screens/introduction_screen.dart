import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/config/router/app_route.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_texts.dart';
import '../../../main_feature/view-model/main_cubit.dart';
import '../../view-model/cubit/intro_cubit.dart';
import '../widgets/introduction_page.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreen();
}

class _IntroductionScreen extends State<IntroductionScreen> {
  late IntroCubit introCubit;
  late List<IntroductionPage> pages;

  @override
  void initState() {
    super.initState();
    introCubit = context.read<IntroCubit>();
    pages = introCubit
        .getIntroductionRepository()
        .getAllIntroductionModelsAsPages();
  }

  int currentIndex = 0;

  void onPageChanges(
    double netDragDistance,
    int pagesLength,
    int currentIndex,
    SlideDirection slideDirection,
  ) {
    setState(() {
      this.currentIndex = currentIndex;
    });
  }

  void _onIntroductionComplete(BuildContext context) {
    context.read<PermissionCubit>().checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PermissionCubit, PermissionState>(
      listener: (context, state) {
        if (state is PermissionGranted) {
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else if (state is PermissionDenied) {
          Navigator.pushReplacementNamed(context, AppRoutes.main);
        }
      },
      child: Stack(
        children: [
          Onboarding(
            swipeableBody: pages,
            onPageChanges: onPageChanges,
            startIndex: 0,
          ),
          SizedBox(
            width: 1.sw, // Full screen width
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: AppConstants.paddingBottomIntroScreen.h,
                  ),
                  child: currentIndex < pages.length - 1
                      ? AnimatedSmoothIndicator(
                          activeIndex: currentIndex,
                          count: pages.length,
                          effect: const ExpandingDotsEffect(),
                        )
                      : OutlinedButton(
                          onPressed: () => _onIntroductionComplete(context),
                          child: Text(
                            AppTexts.endIntroductionPageButtonText,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
