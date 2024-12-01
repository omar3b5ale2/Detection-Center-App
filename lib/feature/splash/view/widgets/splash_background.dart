import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view-model/cubit/splash_cubit.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter:  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Image.asset(
          context
              .read<SplashCubit>()
              .getSplashRepository()
              .getSplashModel()
              .splashScreenBackgroundPattern,
          repeat: ImageRepeat.repeat,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
