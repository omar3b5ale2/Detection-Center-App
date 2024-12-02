import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pyramakerz_assement/core/constants/app_colors.dart';

import 'feature/Intro/view-model/cubit/intro_cubit.dart';
import 'feature/Intro/view/screens/introduction_screen.dart';
import 'feature/home/view/screens/home_screen.dart';
import 'feature/splash/view-model/cubit/splash_cubit.dart';
import 'feature/splash/view/screens/splash_screen.dart';

void main() {
  runApp(const DetectionCenterApp());
}

class DetectionCenterApp extends StatelessWidget {
  const DetectionCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detection Center App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ).copyWith(scaffoldBackgroundColor: AppColors.appBackgroundColor),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
          BlocProvider<IntroCubit>(create: (context) => IntroCubit()),
        ],
        child: BlocBuilder<SplashCubit, SplashState>(
          builder: (context, state) {
            if (state is SplashInitialized) {
              return const SplashScreen();
            }
            final introductionState = context.watch<IntroCubit>().state;
            if (introductionState is IntroductionInitialized) {
              return const IntroductionScreen();
            }

            return const HomeScreen();
          },
        ),
      ),
    );
  }
}
