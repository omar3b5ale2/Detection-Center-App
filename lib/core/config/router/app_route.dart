import 'package:flutter/material.dart';
import 'package:pyramakerz_assement/feature/home/view/screens/home_screen.dart';

import '../../../feature/Intro/view/screens/introduction_screen.dart';
import '../../../feature/splash/view/screens/splash_screen.dart';
import '../../util/page_transition.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String homeScreen = '/home_screen';

  static final Map<String, WidgetBuilder> routeBuilders = {
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const IntroductionScreen(),
    homeScreen: (_) => const HomeScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = routeBuilders[settings.name];
    if (settings.name == onboarding) {
      return PageTransition(IntroductionScreen());
    } else if (builder != null) {
      return MaterialPageRoute(builder: builder);
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Page not found')),
        body: const Center(child: Text('Page not found')),
      ),
    );
  }
}
