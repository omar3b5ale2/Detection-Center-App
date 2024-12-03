import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pyramakerz_assement/core/config/themes/cubit/theme_cubit.dart';
import 'core/config/router/app_route.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_texts.dart';
import 'core/handler/permission_manager.dart';
import 'feature/Intro/view-model/cubit/intro_cubit.dart';
import 'feature/splash/view-model/cubit/splash_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await PermissionsManager.requestPermissions();
  } catch (e) {
    debugPrint('Permissions error: $e');
    return;
  }

  runApp(
    ScreenUtilInit(
        designSize:
            Size(AppConstants.figmaDesignWidth, AppConstants.figmaDesignHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => DetectionCenterApp()),
  );
}

class DetectionCenterApp extends StatelessWidget {
  const DetectionCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<IntroCubit>(create: (context) => IntroCubit()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            title: AppTexts.appName,
            theme: state.themeData,
            locale: Locale('en', 'US'), // Default locale
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', 'SA'), // Arabic locale
            ],
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
