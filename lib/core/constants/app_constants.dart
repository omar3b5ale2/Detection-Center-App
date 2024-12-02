import '../../feature/splash/Model/splash_model.dart';
import '../../generated/assets.dart';

class AppConstants {
/* Start the animation after... (in milliseconds) */
  static const splashScreenBeforeAnimationDelay = 500;
  static const splashScreenAfterAnimationDelay = 1500;
/* Splash animation duration time (in milliseconds) */
  static const splashScreenDuration = 3000;
  static SplashModel splashModel = const SplashModel(
    splashScreenIcon: Assets.imagesLogo,
  //Start the animation after... (in milliseconds)
    splashScreenBeforeAnimationDelay: 500,
  //Splash animation duration time (in milliseconds)

    splashScreenDuration: 1000,
  );
  //components
  static const paddingTop = 24.0;
  static const paddingLeft = 24.0;
  static const paddingRight = 24.0;
  static const paddingBottom = 24.0;
  static const paddingBottomIntroScreen = 32.0;
  static const paddingHorizontal = 24.0;

}
