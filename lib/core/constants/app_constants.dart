import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../feature/splash/Model/splash_model.dart';
import '../../generated/assets.dart';

class AppConstants {
  static const double figmaDesignWidth = 360;
  static const double figmaDesignHeight = 690;
/* Start the animation after... (in milliseconds) */
  static const splashScreenBeforeAnimationDelay = 500;
  static const splashScreenAfterAnimationDelay = 1500;
/* Splash animation duration time (in milliseconds) */
  static const splashScreenDuration = 3000;
  static SplashModel splashModel = const SplashModel(
    splashScreenIcon: Assets.imagesLogo,
    //Start the animation after... (in milliseconds)
    splashScreenBeforeAnimationDelay: 500,
    //Splash animation duration time (in milliseconds)

    splashScreenDuration: 1000,
  );
  //components
  static const paddingTop = 24.0;
  static const paddingLeft = 24.0;
  static const paddingRight = 24.0;
  static const paddingBottom = 24.0;
  static const paddingBottomIntroScreen = 32.0;
  static const paddingHorizontal = 24.0;
  static BorderRadius defaultCircularBorder =
      BorderRadius.all(Radius.circular(8.r)).w;
  static SizedBox userVerticalSpace16w = 16.w.horizontalSpace;
  static SizedBox userVerticalSpace16 = 16.h.verticalSpace;
  static SizedBox userVerticalSpace30 = 30.h.verticalSpace;
  static SizedBox userVerticalSpace60 = 60.h.verticalSpace;
  static SizedBox userVerticalSpace20 = 20.h.verticalSpace;
  static double userElevation2 = 4.w;
  static double userElevation1 = 10.w;
  static BorderRadius materialUserCircularDefault = BorderRadius.circular(6.w);
}
