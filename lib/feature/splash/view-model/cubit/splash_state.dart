part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitialized extends SplashState {}
final class SplashBegin extends SplashState {
  final SplashModel splashModel;
  SplashBegin(
    this.splashModel,
  );
}

final class SplashCompleted extends SplashBegin {
  SplashCompleted(super.splashModel);
}
