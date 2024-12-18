import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_assement/core/config/router/app_route.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';
import 'package:pyramakerz_assement/feature/splash/Model/splash_model.dart';
import 'package:pyramakerz_assement/core/config/themes/cubit/theme_cubit.dart';

import '../../view-model/cubit/splash_cubit.dart';

class SplashIcon extends StatefulWidget {
  const SplashIcon({super.key});

  @override
  State<SplashIcon> createState() => _SplashIconState();
}

class _SplashIconState extends State<SplashIcon>
    with SingleTickerProviderStateMixin {
  late Animation<double> animatedWidth;
  late AnimationController animationController;
  late SplashModel splashModel;

  @override
  void initState() {
    super.initState();

    splashModel =
        context.read<SplashCubit>().getSplashRepository().getSplashModel();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: splashModel.splashScreenDuration),
    )..addListener(() => onUpdate());

    Duration splashScreenDelayDuration =
        Duration(milliseconds: splashModel.splashScreenBeforeAnimationDelay);

    Future.delayed(
        splashScreenDelayDuration, () => animationController.forward());
  }

  void onUpdate() {
    if (animationController.status != AnimationStatus.completed) {
      setState(() {});
      return;
    }

    // Navigate to onboarding screen once the animation completes
    Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    context.read<SplashCubit>().splashCompleted();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        // Determine screen dimensions based on orientation
        return OrientationBuilder(
          builder: (context, orientation) {
            double screenWidth = orientation == Orientation.landscape
                ? ScreenUtil().screenHeight
                : ScreenUtil().screenWidth;

            animatedWidth = Tween<double>(begin: -screenWidth, end: 0).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Curves.fastLinearToSlowEaseIn,
              ),
            );

            double iconWidth = (screenWidth / 2) + animatedWidth.value;

            return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (BuildContext context, ThemeState state) {
              return Container(
                color: state is ThemeLightState
                    ? AppColors.background
                    : AppColors.darkBackground,
// Use theme background
                child: Center(
                  child: Image.asset(
                    splashModel.splashScreenIcon,
                    width: iconWidth.w,
                  ),
                ),
              );
            });
          },
        );
      },
    );
  }
}
