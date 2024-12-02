import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onboarding/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_texts.dart';
import '../../repository/intro_repository.dart';
import '../../view-model/cubit/intro_cubit.dart';
import '../widgets/introduction_page.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreen();
}

class _IntroductionScreen extends State<IntroductionScreen> {
  late IntroCubit cubit;
  late List<IntroductionPage> pages;

  @override
  void initState() {
    super.initState();

    cubit = context.read<IntroCubit>();
    IntroRepository repository = cubit.getIntroductionRepository();
    pages = repository.getAllIntroductionModelsAsPages();
  }

  int currentIndex = 0;
  void onPageChanges(double netDragDistance, int pagesLength, int currentIndex,
      SlideDirection slideDirection) {
    this.currentIndex = currentIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Onboarding(
        swipeableBody: pages,
        onPageChanges: onPageChanges,
        startIndex: 0,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: AppConstants.paddingBottomIntroScreen),
              child: currentIndex < pages.length - 1
                  ? AnimatedSmoothIndicator(
                      activeIndex: currentIndex,
                      count: pages.length,
                      effect: const ExpandingDotsEffect(),
                    )
                  : OutlinedButton(
                      onPressed: () => cubit.introductionCompleted(),
                      child:
                          const Text(AppTexts.endIntroductionPageButtonText)),
            ),
          ],
        ),
      ),
    ]);
  }
}
