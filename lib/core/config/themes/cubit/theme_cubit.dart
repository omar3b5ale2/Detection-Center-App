import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';

import '../app_themes.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLightState(AppTheme.lightTheme));

  void toggleTheme() {
    if (state is ThemeLightState) {
      emit(ThemeDarkState(AppTheme.darkTheme));
    } else {
      emit(ThemeLightState(AppTheme.lightTheme));
    }
  }

  Color getBackgroundColor() {
    if (state is ThemeLightState) {
      return AppColors.background;
    } else {
      return AppColors.darkBackground; // Define a dark background color in AppColors
    }
  }
}
