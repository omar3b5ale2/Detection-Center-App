import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/config/router/app_route.dart';
import 'core/config/themes/app_themes.dart';
import 'core/config/themes/cubit/theme_cubit.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_texts.dart';
import 'feature/Intro/view-model/cubit/intro_cubit.dart';
import 'feature/splash/view-model/cubit/splash_cubit.dart';

void main() async {
  runApp(const DetectionCenterApp());
}

class DetectionCenterApp extends StatelessWidget {
  const DetectionCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<IntroCubit>(create: (context) => IntroCubit()),
      ],
      child: ScreenUtilInit(
        designSize:
            Size(AppConstants.figmaDesignWidth, AppConstants.figmaDesignHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: AppTexts.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: context.watch<ThemeCubit>().state,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
// child: BlocBuilder<SplashCubit, SplashState>(
// builder: (context, state) {
// if (state is SplashInitialized) {
// return const SplashScreen();
// }
// final introductionState = context.watch<IntroCubit>().state;
// if (introductionState is IntroductionInitialized) {
// return const IntroductionScreen();
// }
//
// return const HomeScreen();
// },
// ),
