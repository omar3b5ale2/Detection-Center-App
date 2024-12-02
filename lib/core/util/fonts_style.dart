import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';
import 'package:pyramakerz_assement/core/constants/app_colors.dart';

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
}