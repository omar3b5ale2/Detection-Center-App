import '../../feature/splash/Model/splash_model.dart';

class AppConstants {
  static const splashScreenBackgroundPattern = "assets/gif/bg.gif";

  static const splashScreenIcon = "assets/images/logo.svg";

/* Start the animation after... (in milliseconds) */

  static const splashScreenBeforeAnimationDelay = 500;

  static const splashScreenAfterAnimationDelay = 1500;
/* Splash animation duration time (in milliseconds) */

  static const splashScreenDuration = 1000;

  static SplashModel splashModel = const SplashModel(
    splashScreenBackgroundPattern: "assets/images/splash/arabesque.png",
    splashScreenIcon: "assets/images/splash/ramadan-icon.png",

/* Start the animation after... (in milliseconds) */
    splashScreenBeforeAnimationDelay: 500,
/* Splash animation duration time (in milliseconds) */

    splashScreenDuration: 1000,
  );
}
