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
  } catch (e, stackTrace) {
    debugPrint('Permissions error: $e');
    debugPrint('StackTrace: $stackTrace');
    return;
  }

  runApp(const DetectionCenterApp());
}

class DetectionCenterApp extends StatelessWidget {
  const DetectionCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        AppConstants.figmaDesignWidth,
        AppConstants.figmaDesignHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<SplashCubit>(create: (_) => SplashCubit()),
          BlocProvider<IntroCubit>(create: (_) => IntroCubit()),
          BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: AppTexts.appName,
              theme: state.themeData,
              locale: const Locale('en', 'US'), // Default locale
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', 'SA'), // Arabic locale
              ],
              initialRoute: AppRoutes.splash,
              onGenerateRoute: AppRoutes.generateRoute,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
