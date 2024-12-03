
part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {
  final ThemeData themeData;

  const ThemeState(this.themeData);
}

class ThemeLightState extends ThemeState {
  const ThemeLightState(super.themeData);
}

class ThemeDarkState extends ThemeState {
  const ThemeDarkState(super.themeData);
}

