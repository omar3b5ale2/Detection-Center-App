import 'package:flutter/widgets.dart';

import '../../../core/constants/app_texts.dart';
import '../../../generated/assets.dart';
import '../model/intro_model.dart';
import '../view/widgets/introduction_page.dart';

class IntroRepository {
  final List<IntroModel> _introductionsPages = [
    IntroModel(
      introductionTitle: AppTexts.firstIntroductionPageTitle,
      introductionDescription: AppTexts.firstIntroductionPageDescription,
      introductionIconWidget: Image.asset(Assets.imagesWelcome, width: 200.0),
    ),
    IntroModel(
        introductionTitle: AppTexts.secondIntroductionPageTitle,
        introductionDescription: AppTexts.secondIntroductionPageDescription,
        introductionIconWidget: Image.asset(Assets.imagesVoice, width: 200.0)),
    IntroModel(
        introductionTitle: AppTexts.thirdIntroductionPageTitle,
        introductionDescription: AppTexts.thirdIntroductionPageDescription,
        introductionIconWidget: Image.asset(Assets.imagesObject, width: 200.0)),
  ];
  List<IntroductionPage> getAllIntroductionModelsAsPages() =>
      _introductionsPages.map((model) => IntroductionPage(model)).toList();
}
