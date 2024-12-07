import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_assement/core/config/themes/cubit/theme_cubit.dart';
import 'package:pyramakerz_assement/core/util/app_colors.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/util/fonts_style.dart';
import '../../model/intro_model.dart';

class IntroductionPage extends StatelessWidget {
  final IntroModel introductionModel;
  const IntroductionPage(this.introductionModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
      return Scaffold(
        backgroundColor: state is ThemeLightState
            ? AppColors.background
            : AppColors.darkBackground,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: AppConstants.paddingBottom),
                    child: introductionModel.introductionIconWidget,
                  ),
                  Text(
                    style: FontsStyle.italicBoldNotoSans(24.sp),
                    introductionModel.introductionTitle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.paddingHorizontal),
                    child: Text(
                      introductionModel.introductionDescription,
                      textAlign: TextAlign.center,
                      style: FontsStyle.boldDmSerifText(16.sp),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
