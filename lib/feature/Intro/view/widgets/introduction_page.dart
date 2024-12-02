import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/util/fonts_style.dart';
import '../../model/intro_model.dart';

class IntroductionPage extends StatelessWidget {
  final IntroModel introductionModel;
  const IntroductionPage(this.introductionModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding:
                      const EdgeInsets.only(bottom: AppConstants.paddingBottom),
                  child: introductionModel.introductionIconWidget,
                ),
                Text(
                  style: FontsStyle.italicBoldNotoSans(24),
                  introductionModel.introductionTitle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingHorizontal),
                  child: Text(
                    introductionModel.introductionDescription,
                    textAlign: TextAlign.center,
                    style: FontsStyle.boldDmSerifText(16),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
