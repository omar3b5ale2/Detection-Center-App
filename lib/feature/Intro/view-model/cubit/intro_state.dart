part of 'intro_cubit.dart';

@immutable
sealed class IntroState {}
final class IntroductionInitialized extends IntroState {}
final class IntroductionCompleted extends IntroState {}
final class IntroductionBegin extends IntroState {
  final List<IntroductionPage> introductionPages;
  IntroductionBegin(this.introductionPages);
}