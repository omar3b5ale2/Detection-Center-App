import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';

class FontsStyle {
  static italicBoldNotoSans(double size) {
    return GoogleFonts.notoSans(
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: AppColors.primaryColor,
      fontSize: size,
    );
  }

  static boldDmSerifText(double size) {
    return GoogleFonts.dmSerifText(
      fontWeight: FontWeight.bold,
      color: AppColors.secondaryColor,
      fontSize: size,
    );
  }

  static style30() =>
      _interTextStyle(30.sp, FontWeight.w700, AppColors.deepGray, 0.0);

  static style30F() => _jotiOne(35.sp, FontWeight.w400, AppColors.deepGray,
      0.5); // like any screen header.
  static style30Animated() => _interTextStyle(
      30.sp, FontWeight.bold, AppColors.black, 0.0); // like any screen header.
  static style14Bold() =>
      _interTextStyle(14.sp, FontWeight.bold, AppColors.darkGray, 0.0);
  static style15Bold() =>
      _interTextStyle(15.sp, FontWeight.bold, AppColors.blueDark, 0.0);

  static style16xW700() =>
      _interTextStyle(16.sp, FontWeight.w700, AppColors.darkGray, 0.0);
  static style16W500() =>
      _interTextStyle(16.sp, FontWeight.w500, AppColors.darkGray, 1.5);

  static style16xW700Dblue() =>
      _interTextStyle(16.sp, FontWeight.w700, AppColors.darkBlue, 0.0);

  static style16xW700cornFlowerPrimary() => _interTextStyle(
      16.sp,
      FontWeight.w700,
      AppColors.cornFlowerPrimary,
      0.0);
  static style16xW500() => _interTextStyle(16.sp, FontWeight.w500,
      AppColors.darkBlueGray, 0.09);
  static style14xW500() =>
      _interTextStyle(14.sp, FontWeight.w500, AppColors.darkBlueGray, 0.09);
  static style16x2() => _interTextStyle(16.sp, FontWeight.w700, AppColors.white,
      0.0);
  static style14() => _interTextStyle(
      14.sp,
      FontWeight.w500,
      AppColors.charcoalGray,
      0);
  static style11() =>
      _interTextStyle(11.sp, FontWeight.w500, AppColors.lightGray, 0);
  static style20() => _interTextStyle(
      20.sp,
      FontWeight.w500,
      AppColors.charcoalGray,
      0);

  static style16x2W400() => _interTextStyle(
      16.sp, FontWeight.w400, AppColors.darkGray, 0.0); // onBoarding subTitle.
  static style24W700() => _interTextStyle(
      24.sp, FontWeight.w700, AppColors.nearBlack, 0.0); // onBoarding Title.
  static style22urbanist() => _urbanist(22.sp, FontWeight.w700,
      AppColors.deepGray, 0.0); // like any screen header.

//-------------------------------------- FontSize
  static TextStyle _interTextStyle(
      double fontSize, FontWeight fontWeight, Color color, double height) {
    return GoogleFonts.inter(
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ).copyWith(overflow: TextOverflow.ellipsis);
  }

  static TextStyle _urbanist(
      double fontSize, FontWeight fontWeight, Color color, double height) {
    return GoogleFonts.urbanist(
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ).copyWith(overflow: TextOverflow.ellipsis);
  }

  static TextStyle _jotiOne(
      double fontSize, FontWeight fontWeight, Color color, double height) {
    return GoogleFonts.jotiOne(
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ).copyWith(overflow: TextOverflow.ellipsis);
  }
}
